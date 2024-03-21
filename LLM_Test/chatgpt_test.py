import openai

openai.api_key = os.environ['OPENAI_KEY']
completion = openai.ChatCompletion.create(
  model="davinci-002", 
  messages=[{"role": "user", "content": "What is the OpenAI mission?"}]
)

print(completion)