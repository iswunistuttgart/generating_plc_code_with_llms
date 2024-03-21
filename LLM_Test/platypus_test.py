# Use a pipeline as a high-level helper
# from transformers import pipeline

# pipe = pipeline("text-generation", model="garage-bAInd/Platypus2-70B-instruct")

# Load model directly
from transformers import AutoTokenizer, AutoModelForCausalLM

tokenizer = AutoTokenizer.from_pretrained("garage-bAInd/Platypus2-70B-instruct")
model = AutoModelForCausalLM.from_pretrained("garage-bAInd/Platypus2-70B-instruct")