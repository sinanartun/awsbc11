import uvicorn
import os

if __name__ == "__main__":
    # Get the absolute path to the certificate files
    current_dir = os.path.dirname(os.path.abspath(__file__))
    ssl_keyfile = os.path.join(current_dir, "certs", "privkey.pem")
    ssl_certfile = os.path.join(current_dir, "certs", "fullchain.pem")

    uvicorn.run(
        "twitter_fastapi.app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        ssl_keyfile=ssl_keyfile,
        ssl_certfile=ssl_certfile
    )