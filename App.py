from openai import OpenAI
import os
from stopit import threading_timeoutable as timeoutable

def start(client):
    while (prompt := input('To quit, type in \'quit\'\nPlease input the instruction:\n<< ')) != 'quit':
        st = ' '
        if prompt == 'quit':
            return
        prompt += '\n'
        
        while st != '':
            st = input('   ')
            if st == 'quit':
                return
            prompt += st + '\n'
    
        flag = 0
        response = None
        for _ in range(3):
            response = request(timeout=1,prompt=prompt,client=client)
            if response == None:
                flag = 1
                break
            if ('VAR' in response or 'END_VAR' in response or 'END_IF' in response or 'THEN' in response or ':=' in response) and '{' not in response and '}' not in response:
                flag = 2
                break
            
        if flag == 1:
            print('Timeouterror. Please try again.')
        elif flag == 0 or response == None:
            print('Error. Something went wrong. Please try input something else.')
        else:
            print('>> ' + response)
            
        print('\n')
     
@timeoutable()   
def request(prompt: str, client: OpenAI):
    completion = client.chat.completions.create(
                model="gpt-4",
                messages=[
                    {"role": "system", "content": """You are an IEC-61131-3 Structured Text Coding Assistant, that helps me to write Structured Text.
            Your task is to generate Structured Text with the functionality I give you. You should only output Structured Text. Describing Text should be minimal.
            Following rules should be followed:
            - variables should be declared between VAR and END_VAR
            - when using control structures do not forget END_<controll structure>
            - switch cases should be avoided unless instructed in the task
            - use the right quotation marks for the string type
            - implementing a function should be avoided
            - only when implementing a function: the variables should be declared inside the function; the return value should be stored in a variable named after the function; RETURN should be used correctly, to return to the main method and not to return a value
            You should use the Variables I provide you.
            """},
                    {"role": "user", "content": prompt}
                ]
            )
    response = completion.choices[0].message.content
    return response


if __name__ == '__main__':
    client = OpenAI(api_key=os.environ['OPENAI_KEY'])
    clear = lambda: os.system('cls')
    clear()
    start(client)


# import openai
# import streamlit as st

# openai.api_key = os.environ['OPENAI_KEY']
# st.set_page_config(page_title="ST Generator",
#                     layout='centered',
#                     initial_sidebar_state='collapsed')
# st.title("Generate IEC-61131-3 Structured Text ")


# if "openai_model" not in st.session_state:
#     st.session_state["openai_model"] = "gpt-3.5-turbo"

# if "messages" not in st.session_state:
#     st.session_state.messages = []

# for message in st.session_state.messages:
#     with st.chat_message(message["role"]):
#         st.markdown(message["content"])

# if prompt := st.chat_input("What is up?"):
#     st.session_state.messages.append({"role": "user", "content": prompt})
#     with st.chat_message("user"):
#         st.markdown(prompt)

#     with st.chat_message("assistant"):
#         message_placeholder = st.empty()
#         full_response = ""
#         for response in client.chat.completions.create(
#             model=st.session_state["openai_model"],
#             messages=[
#                 {"role": m["role"], "content": m["content"]}
#                 for m in st.session_state.messages
#             ],
#             stream=True,
#         ):
#             full_response += (response.choices[0].delta.content or "")
#             message_placeholder.markdown(full_response + "▌")
#         message_placeholder.markdown(full_response)
#     st.session_state.messages.append({"role": "assistant", "content": full_response})