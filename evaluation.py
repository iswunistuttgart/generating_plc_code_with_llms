from ctransformers import AutoModelForCausalLM
import code_bert_score
import time
import os
import pandas as pd
import numpy as np 
   
class Evaluation:
    
    def __init__(self, max_new_tokens=512, context_length=2048, temperature=0.1):
        self.models = ["CodeLlama", "Platypus2", "StableCode"]
        self.runs = ["first run", "second run", "third run"]
        self.llms = []
        for model in ["codellama-7b-instruct.Q4_K_M.gguf", "platypus2-13b.Q4_K_M.gguf", "stablecode-instruct-alpha-3b.ggmlv1.q5_1.bin"]:
             model_path = f"../model/{model}"
             model_type = "gpt-neox" if model == "stablecode-instruct-alpha-3b.ggmlv1.q5_1.bin" else "llama"
             # our LLM
             llm = AutoModelForCausalLM.from_pretrained(model_path, model_type=model_type, 
                                                     max_new_tokens=max_new_tokens,
                                                     context_length=context_length,
                                                     temperature=temperature)
             self.llms.append(llm)
            
            
    def generate_st_without_promptopti(self):
        for index, llm in enumerate(self.llms):
            for run in self.runs:
                with open("prompts.txt", "r") as file:
                    lines = file.readlines() # all prompts in lines
                    # for each prompt
                    for i, prompt in enumerate(lines):
                        # generate code and stop time
                        start = time.time()
                        response = llm(f"###Instruction:\n{prompt}\n###Response:\n")
                        end = time.time()
                        duration = end-start

                        # write the code and time in a file
                        file_path = f"Code#1/{self.models[index]}/{run}/{i+1}.st"
                        with open(file_path, "w") as structuredText:
                            structuredText.write(f"// {duration}s\n")
                            structuredText.write(response)            
            
            
    def generate_st_with_promptopti(self):
        for index ,llm in enumerate(self.llms):
            for run in self.runs:
                dir_path = "./Prompts"
                # go through each prompt file
                for datei in os.listdir(dir_path):
                    file_path = os.path.join(dir_path,datei)
                    if os.path.isfile(file_path):
                        # get the prompt
                        file = open(file_path)
                        prompt = file.read()
                        file.close()
                        
                        # generate code and stop time
                        start = time.time()
                        response = llm(f"###Instruction:\n{prompt}\n###Response:\n")
                        end = time.time()
                        duration = end-start

                        # write the code and time into a file
                        file_path = f"Code#2/{self.models[index]}/{run}/{datei.replace('txt','st')}"
                        with open(file_path, "w") as structuredText:
                            structuredText.write(f"// {duration}s\n")
                            structuredText.write(response)
                            
    def code_bert_score(self):
        for model in ["ChatGPT_4", "ChatGPT_3.5", "Bard", "CodeLlama", "Platypus2", "StableCode"]:
            for j in range(1,3):
                for run in self.runs:
                    results = []
                    # get prompt
                    with open('prompts.txt','r') as prompts:
                        i = 1
                        sources = prompts.readlines()
                        for source in sources:
                        
                            # get generated structured text
                            pred_path = f'Code#{j}/{model}/{run}/{i}.st'
                            with open(pred_path, 'r') as file:
                                p = file.read()
                            pred = [p]

                            # get reference structured text
                            ref_path = f'PLC_Code/{i}.st'
                            with open(ref_path, 'r') as file:
                                r = file.read()
                            ref = [r]

                            # calculate score and append to results list
                            result = code_bert_score.score(cands=pred, refs=ref, lang="python", sources=[source])
                            print(result)
                            results.extend(result)
                            i += 1

                    # write the scores into a file
                    result_path = f'Code#{j}/{model}/{run}/BertScore.csv'
                    with open(result_path, 'w') as file:
                        for k in range(len(results)):
                            value = str(results[k].item())
                            file.write(value)
                            if k > 1 and (k + 1) % 4 == 0:
                                file.write('\n')
                            else:
                                file.write(', ')
    
    def pass_at_k(self, n, c, k):
        """
        : param n : total number of samples
        : param c : number of correct samples
        : param k : k in pass@k
        """
        if n - c < k :
            return 1.0
        return 1.0 - np.prod(1.0 - k / np.arange(n - c + 1 , n + 1 ) )
    
    def median_bertScore(self):
        columns = ['p','f','f1','f3']

        # calculate the median F3-score from the three runs and write them into a seperate file
        for j in range(1,3):
            for llm in ["ChatGPT_4", "ChatGPT_3.5", "Bard", "CodeLlama", "Platypus2", "StableCode"]:
                df1 = pd.read_csv(f'Code#{j}/{llm}/first run/BertScore.csv', header=None,names=columns)
                df2 = pd.read_csv(f'Code#{j}/{llm}/second run/BertScore.csv', header=None,names=columns)
                df3 = pd.read_csv(f'Code#{j}/{llm}/third run/BertScore.csv', header=None,names=columns)
                all_dfs = [df1, df2, df3]
                
                median_f3_values = pd.concat([df['f3'] for df in all_dfs], axis=1).median(axis=1)
                new_df = pd.DataFrame(columns = columns)
                for i in range(21):
                    if median_f3_values[i] == df1.iloc[i]['f3']:
                        new_df = pd.concat([new_df,df1.iloc[[i]]], ignore_index=True)
                    elif median_f3_values[i] == df2.iloc[i]['f3']:
                        new_df = pd.concat([new_df,df2.iloc[[i]]], ignore_index=True)
                    elif median_f3_values[i] == df3.iloc[i]['f3']:
                        new_df = pd.concat([new_df,df3.iloc[[i]]], ignore_index=True)
                        
                average = new_df.mean()
                new_df.loc['average'] = average
                # new_df.to_csv(f'Code#{j}/{llm}/BertScore.csv', index=False,header=False)
                new_df.to_csv(f'Code#{j}/{llm}/BertScore.csv')
    

if __name__ == '__main__':
    eval = Evaluation()
    eval.generate_st_without_promptopti()
    eval.generate_st_with_promptopti()
    eval.code_bert_score()
    eval.median_bertScore()
    
    list = [0,11,28,8,0,0]
    for a in list:
        b = []
        for i in range(1,4):
            k = eval.pass_at_k(63,a,i)
            b.append(k)
        print(b)

    print('-----------------------')
    list = [4,22,36,3,0,0]
    for a in list:
        b = []
        for i in range(1,4):
            k = eval.pass_at_k(63,a,i)
            b.append(k)
        print(b)
