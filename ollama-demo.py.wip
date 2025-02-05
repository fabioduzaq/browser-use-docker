    import os

    # Optional: Set the OLLAMA host to a remote server
    os.environ["OLLAMA_HOST"] = "http://host.docker.internal:11434"

    import asyncio
    from browser_use import Agent
    from browser_use.agent.views import AgentHistoryList
    from langchain_ollama import ChatOllama


    async def run_search() -> AgentHistoryList:
        agent = Agent(
            task="Search for a 'browser use' post on the r/LocalLLaMA subreddit and open it.",
            llm=ChatOllama(
            model='qwen2.5-coder:3b',
            num_ctx=128000,
            ),
            tool_call_in_content=False,
        )

        result = await agent.run()
        return result


    async def main():
        result = await run_search()
        print("\n\n", result)


    if __name__ == "__main__":
        asyncio.run(main())