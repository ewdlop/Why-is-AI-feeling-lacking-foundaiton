import openai
import requests
from requests.auth import HTTPBasicAuth

# Set up your OpenAI and GitHub credentials
openai.api_key = 'YOUR_OPENAI_API_KEY'
github_token = 'YOUR_GITHUB_PERSONAL_ACCESS_TOKEN'
repo_owner = 'YOUR_GITHUB_USERNAME'
repo_name = 'YOUR_REPOSITORY_NAME'

def generate_idea(prompt):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=100
    )
    idea = response.choices[0].text.strip()
    return idea

def generate_code(idea):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=f"Write a Python program based on the following idea: {idea}",
        max_tokens=200
    )
    code = response.choices[0].text.strip()
    return code

def create_file_content(file_path, content):
    url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/contents/{file_path}"
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }
    data = {
        "message": f"Add {file_path}",
        "content": content.encode('utf-8').decode('latin1'),
        "branch": "main"
    }
    response = requests.put(url, json=data, headers=headers)
    if response.status_code == 201:
        print("File created successfully.")
    else:
        print(f"Failed to create file: {response.json()}")

def main():
    prompt = "Generate a big idea for a new software project."
    idea = generate_idea(prompt)
    print(f"Idea: {idea}")

    code = generate_code(idea)
    print(f"Code: {code}")

    file_path = "generated_code.py"
    create_file_content(file_path, code)

if __name__ == "__main__":
    main()
