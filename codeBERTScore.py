import code_bert_score
import pandas as pd

llms = ["ChatGPT_4", "ChatGPT_3.5", "Bard", "CodeLlama", "Platypus2", "StableCode"]
runs = ["first", "second", "third"]
# runs = ["first"]

for llm in llms:
    for run in runs:
        results = []
        with open('04_Umsetzung/prompts.txt','r') as prompts:
            i = 1
            sources = prompts.readlines()
            for source in sources:
            
                pred_path = f'04_Umsetzung/Code#1/{llm}/{run} run/{i}.st'
                with open(pred_path, 'r') as file:
                    p = file.read()
                pred = [p]

                ref_path = f'04_Umsetzung/PLC_Code/{i}.st'
                with open(ref_path, 'r') as file:
                    r = file.read()
                ref = [r]

                # prompt_path = f'04_Umsetzung/Prompts/{i}.txt'
                # with open(prompt_path, 'r') as file:
                #     s = file.read()
                # sources = [s]

                result = code_bert_score.score(cands=pred, refs=ref, lang="python", sources=[source])
                print(result)
                results.extend(result)
                i += 1

        result_path = f'04_Umsetzung/Code#1/{llm}/{run} run/BertScore.csv'
        with open(result_path, 'w') as file:
            for j in range(len(results)):
                value = str(results[j].item())
                file.write(value)
                if j > 1 and (j + 1) % 4 == 0:
                    file.write('\n')
                else:
                    file.write(', ')
                    

columns = ['p','f','f1','f3']

for j in range(1,3):
    for llm in ["ChatGPT_4", "ChatGPT_3.5", "Bard", "CodeLlama", "Platypus2", "StableCode"]:
        df1 = pd.read_csv(f'04_Umsetzung/Code#{j}/{llm}/first run/BertScore.csv', header=None,names=columns)
        df2 = pd.read_csv(f'04_Umsetzung/Code#{j}/{llm}/second run/BertScore.csv', header=None,names=columns)
        df3 = pd.read_csv(f'04_Umsetzung/Code#{j}/{llm}/third run/BertScore.csv', header=None,names=columns)
        all_dfs = [df1, df2, df3]
        
        median_f3_values = pd.concat([df['f3'] for df in all_dfs], axis=1).median(axis=1)
        new_df = pd.DataFrame(columns = columns)
        for i in range(20):
            if median_f3_values[i] == df1.iloc[i]['f3']:
                new_df = pd.concat([new_df,df1.iloc[[i]]], ignore_index=True)
            elif median_f3_values[i] == df2.iloc[i]['f3']:
                new_df = pd.concat([new_df,df2.iloc[[i]]], ignore_index=True)
            elif median_f3_values[i] == df3.iloc[i]['f3']:
                new_df = pd.concat([new_df,df3.iloc[[i]]], ignore_index=True)
                
        average = new_df.mean()
        new_df.loc['average'] = average
        new_df.to_csv(f'04_Umsetzung/Code#{j}/{llm}/BertScore.csv', index=False,header=False)