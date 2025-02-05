from langchain_openai import ChatOpenAI
from browser_use import Agent
import asyncio
import os
from dotenv import load_dotenv

load_dotenv()

async def main():
    agent = Agent(
        task="Go to Reddit, search for 'browser-use', click on the first post and return the first comment.",
        llm=ChatOpenAI(
            model="deepseek-ai/DeepSeek-R1", 
            base_url="https://api.kluster.ai/v1",
            api_key=os.getenv("KLUSTER_AI_BROWSER_USE")
        ),
    )
    result = await agent.run()
    print(result)

asyncio.run(main())
