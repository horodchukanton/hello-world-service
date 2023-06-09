from fastapi import FastAPI

app = FastAPI()

counter = 0


@app.get("/")
async def root():
    return {"message": "Hello World! Check '/hello/<name>' and '/docs' dynamic links too."}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
