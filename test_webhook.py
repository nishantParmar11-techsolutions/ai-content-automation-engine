import os
import json
import logging
import requests
from dotenv import load_dotenv

# Load environment variables from .env if present
load_dotenv()

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - [Webhook Tester] - %(message)s"
)

# Configuration
WEBHOOK_URL = os.getenv("WEBHOOK_URL", "http://localhost:5678/webhook/generate-content")

def trigger_content_pipeline():
    """
    Simulates an external client or CRM firing a payload 
    to test the n8n multi-agent content generation engine.
    """
    payload = {
        "topic": "Why B2B Tech Startups Are Switching to n8n for Multi-Agent Workflows",
        "target_audience": "Founders, CTOs, and RevOps Leaders",
        "guidelines": "Direct-response, punchy, authoritative, zero fluff."
    }
    
    headers = {
        "Content-Type": "application/json"
    }

    logging.info(f"Dispatching test payload to endpoint: {WEBHOOK_URL}")
    
    try:
        response = requests.post(
            WEBHOOK_URL,
            json=payload,
            headers=headers,
            timeout=30
        )
        
        # Log results
        logging.info(f"Webhook Response Status Code: {response.status_code}")
        
        try:
            response_data = response.json()
            logging.info(f"Response Payload:\n{json.dumps(response_data, indent=2)}")
        except ValueError:
            logging.info(f"Raw Response Text: {response.text}")
            
    except requests.exceptions.RequestException as e:
        logging.critical(f"Failed to communicate with automation engine webhook: {e}")

if __name__ == "__main__":
    trigger_content_pipeline()
  
