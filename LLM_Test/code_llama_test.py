# # Load model directly
# from transformers import AutoTokenizer, AutoModelForCausalLM

# tokenizer = AutoTokenizer.from_pretrained("codellama/CodeLlama-7b-Instruct-hf")
# model = AutoModelForCausalLM.from_pretrained("codellama/CodeLlama-7b-Instruct-hf")

from transformers import pipeline, AutoTokenizer, AutoModelForCausalLM
import torch
import time

device = "cuda" if torch.cuda.is_available() else "cpu"

tokenizer = AutoTokenizer.from_pretrained("codellama/CodeLlama-7b-Instruct-hf")
print("token")
model = AutoModelForCausalLM.from_pretrained("codellama/CodeLlama-7b-Instruct-hf")
model.to(device)
print("model loaded")

inputs = tokenizer("###Instruction\nGive me an IEC 61131-3 structured text program with two alarms represented by the variables xAlarm1 and xAlarm2. With the signal xAllOn all alarms should be set to TRUE. With the signal xAllOff all alarms should be set to FALSE. The signals should be turned off.\n###Response\n", return_tensors="pt", return_token_type_ids=False).to(device)
print("generating")
start = time.time()
tokens = model.generate(
  **inputs,
  max_new_tokens=1024,
  temperature=0.1,
  do_sample=True,
)
end = time.time()

print(tokenizer.decode(tokens[0], skip_special_tokens=True))
print(end-start, 's')

# pipe = pipeline("text-generation", model="codellama/CodeLlama-7b-Instruct-hf")

# for out in pipe("Write a python program to perform binary search in a given list.", do_sample = True, max_length=1024,):
#     print(out)




# conversation_text = '''SYSTEM: You are a helpful coding assistant that provides code based on the given query in context.
# ### Instruction: Write a python program to perform binary search in a given list.
# ### Response: '''

# sequences = pipeline(
#     conversation_text,
#     do_sample=True,
#     top_k=10,
#     num_return_sequences=1,
#     eos_token_id=tokenizer.eos_token_id,
#     max_length=2048,
# )
# for seq in sequences:
#     print(f"Result: {seq['generated_text']}")