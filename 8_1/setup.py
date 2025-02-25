import nltk

def download_nltk_data():
    try:
        # Download required NLTK data
        nltk.download('punkt')
        nltk.download('stopwords')
        nltk.download('wordnet')
        print("NLTK data downloaded successfully!")
    except Exception as e:
        print(f"Error downloading NLTK data: {e}")

if __name__ == "__main__":
    download_nltk_data()