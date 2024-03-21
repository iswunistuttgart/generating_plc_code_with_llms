list = ["first run", "second run", "third run"]
llms = ["Bard","ChatGPT_3.5", "ChatGPT_4"]
for llm in llms:
    for run in list:
        for i in range(1,21):
            # Full path for the file
            full_path = f"04_Umsetzung/Code#2/{llm}/{run}/{i}.st"
            # Open the file in write mode which will create the file if it does not exist
            with open(full_path, 'w') as file:
                # No need to write anything, just creating an empty file
                pass

# with open("04_Umsetzung/prompts.txt", "r") as a:
#     prompts = a.readlines()
#     i = 1
#     for prompt in prompts:
#         with open(f"04_Umsetzung/Prompts/{i}.txt", "w") as b:
#             b.write(prompt)
#             i += 1