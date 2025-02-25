import joblib
import os

# Get the absolute path to the model files
current_dir = os.path.dirname(os.path.abspath(__file__))
model_path = os.path.join(current_dir, '..', 'models', 'logistic_model.pkl')
vectorizer_path = os.path.join(current_dir, '..', 'models', 'tfidf_vectorizer.pkl')

try:
    model = joblib.load(model_path)
    vectorizer = joblib.load(vectorizer_path)
except FileNotFoundError as e:
    raise FileNotFoundError(f"Model files not found. Please ensure both model files exist in the models directory. Error: {e}")

def predict_sentiment(text: str):
    vectorized_text = vectorizer.transform([text])
    prediction = model.predict(vectorized_text)
    return prediction[0]
