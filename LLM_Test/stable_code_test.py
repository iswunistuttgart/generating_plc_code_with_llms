from ctransformers import AutoModelForCausalLM, AutoConfig

# config = AutoConfig.from_pretrained("../model/stablecode-instruct-alpha-3b.ggmlv1.q5_1.bin")
# config.max_seq_len(2048)
llm = AutoModelForCausalLM.from_pretrained("../model/stablecode-instruct-alpha-3b.ggmlv1.q5_1.bin", model_type="gpt-neox", max_new_tokens=512,context_length=2048,temperature=0.1)
print(llm("""###Instruction:
Give me an IEC 61131-3 structured text function block FB1005 with following functionality. When producing ceramic insulation panels, it must be checked after firing whether the thickness of the panel is within a specified tolerance band. To do this, the plates are pushed through a measuring point consisting of two lasers at a uniform speed. The thickness of the plates is determined from the difference between the measurements of the two lasers. For each measurement, the smallest and largest value of the plate thickness is recorded. If these are outside the tolerance band, the plate is considered scrap. A function block FB 1005 must be designed that checks the plate thickness, which results from the difference between the two laser measurements. During and after the measurement, the function block should output the largest (M_MAX) or smallest value (M_MIN) of the plate thickness. If the two values are outside the range specified with V_MAX and V_MIN, the reject light P1 is switched on. The measurement is started and ended with the sensor S1, which delivers a 1 signal as long as the ceramic plate is in the measuring device. At the start of a new measurement, the output values of the function block are overwritten with the values of the new measuring cycle. To test the function block FB 1005, sensor S1 is connected to the START input. A flag double word MD_1 is assigned to the THICKNESS function input. Any REAL numbers can be written to V-MAX and V_MIN. Flag double words are written to the output values D_MAX and D_MIN.
###Response:
          
"""))


# from transformers import AutoModelForCausalLM, AutoTokenizer
# import time

# tokenizer = AutoTokenizer.from_pretrained("stabilityai/stablecode-instruct-alpha-3b")
# model = AutoModelForCausalLM.from_pretrained(
#   "stabilityai/stablecode-instruct-alpha-3b",
#   trust_remote_code=True,
#   torch_dtype="auto",
# )
# # model.cuda()
# start = time.time()
# # inputs = tokenizer("###Instruction\nGenerate structured text PLC logic that prints out a fibonacci number\n###Response\n", return_tensors="pt", return_token_type_ids=False).to("cuda")
# inputs = tokenizer("###Instruction\nGenerate structured text PLC logic that prints out a fibonacci number\n###Response\n", return_tensors="pt", return_token_type_ids=False)
# tokens = model.generate(
#   **inputs,
#   max_new_tokens=150,
#   temperature=0.1,
#   do_sample=True,
# )
# end = time.time()
# print(tokenizer.decode(tokens[0], skip_special_tokens=True))
# print(end - start, 'seconds')