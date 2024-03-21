for llm in ['Bard', 'ChatGPT_3.5','ChatGPT_4','CodeLlama','Platypus2','StableCode']:
    with open(f"04_Umsetzung/Code#2/{llm}/category.csv",'w') as csv:
        results = []
        for i in range(1,21):
            result = ''
            for run in ["first run", "second run", "third run"]:
                path = f"04_Umsetzung/Code#2/{llm}/{run}/{i}.st"
                with open(path,"r") as file:
                    file.readline()
                    number = file.readline().replace('//','').rstrip("\n")
                    result += number+','
            results.append(result)
        print(results)
        for category in results:
            csv.write(category)
            csv.write('\n')