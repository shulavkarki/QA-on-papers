# Text Classifcation using BERT
A conversational system that reads text from a PDF file, performs text embedding using a sentence transformer model, conducts a search based on user input, and generates responses using text generation models 

## Depedencies

- Python 3.10
- Required libraries: pdfminer, sentence-transformers

## Getting Started

Follow these steps to set up and run your project.

### Installation

1. Clone the repository

   ```bash
   git clone https://github.com/shulavkarki/QA-on-papers

2. Create a new virtual environment using micromamba:

   ```bash
   micromamba env create -f env.yaml


3. Activate the virtual environment:

   ```bash
   micromamba activate chatpdf
  

4. Navigate to the project repository:

   ```bash
   cd QA-on-papers

5. Run Falcon Service:

   ```bash
   make run_falcon

5. Run Script:

   ```bash
   python chat_pdf.py --fname attention.pdf

### Note
To run with specific arguments  
    
    python script.py --fname <pdf_filename> --top-k <top_k_value>   --window-size <window_size_value> --step-size <step_size_value>

    --fname: Specify the PDF file name.
    --top-k: Set the top-k value for selecting relevant paragraphs.
    --window-size: Set the window size for tokenization.
    --step-size: Set the step size for overlapping windows.


## Workflow Overview
1. Text Extraction:

    The script reads a PDF file specified by the user.
    It extracts text from the PDF using the extract_text function.

2. Text Preprocessing:

    Whitespace normalization is performed on the extracted text to ensure consistent spacing between words.

3. Tokenization into Windows:

    The normalized text is tokenized into overlapping windows of words.
    These windows are stored as lists of words in the sentences list.

4. Text Embedding:

    The sentence transformer model (sentence-transformers/all-mpnet-base-v2) is used to embed the tokenized text into high-dimensional vectors.
    The embeddings are used to represent the context paragraphs.

5. Semantic Search:

    A user query is embedded using the same sentence transformer model.
    Semantic search is performed to find the most similar paragraphs to the user's query based on embeddings.
    The top results are obtained.

6. Cross-Encoding:

    For each hit (pair of query and context paragraph), a cross-encoder model (cross-encoder/ms-marco-MiniLM-L-6-v2) is used to predict the cross-encoding score.
    The cross-encoding scores are added to the hits, and the hits are sorted based on these scores in descending order.

7. Text Generation:

    The top-ranked paragraphs are used as context for text generation.
    Text generation model Falcon 7B are employed to generate responses to the user's query.