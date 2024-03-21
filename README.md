# generating_plc_code_with_llms
## Dependencies 
To install all required dependencies for both the application and the evaluation, run
> pip install -r ./requirements.txt

## Run Application
- Set your OpenAI-API-Key to the environment variable `OPENAI-KEY`
    - To get your API-Key, go to following [link](https://platform.openai.com/api-keys).
    - To access the API, you may have to add a payment method and transfer some money.
- To start the Application, run the `App.py` file.
- Enter the desired functionality of your structured text.
- You can enter multiple lines with the 'Enter'.
- To submit your request, press the 'Enter'-key twice.
- For better results, please send the variables you wish to use.
    > VAR \
    > // your variables\
    > END_VAR
- Enter `quit` any time to exit the program.

## Run Evaluation

The Evaluation generates three times 21 structured text programmes with and without prompt optimization and saves them into `Code#1` and `Code#2`. The file calculates the codeBERTScore, stops the time and saves them into there respective files.
- Go to following links [Code Llama](https://huggingface.co/TheBloke/CodeLlama-7B-Instruct-GGUF/blob/main/codellama-7b-instruct.Q4_K_M.gguf), [Platypus2](https://huggingface.co/TheBloke/Platypus2-13B-GGUF/blob/main/platypus2-13b.Q4_K_M.gguf), [StableCode](https://huggingface.co/TheBloke/stablecode-instruct-alpha-3b-GGML/blob/main/stablecode-instruct-alpha-3b.ggmlv1.q5_1.bin) and download each file. This may take a while.
- Save them to a folder names `models` above your current directory
- Run the file
