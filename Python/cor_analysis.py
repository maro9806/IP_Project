from flask import Flask, render_template, request, url_for
import requests
import json

app = Flask(__name__)

def get_news(query):
    # NewsAPI 키 파일에서 읽기
    try:
        with open(r"C:\Users\USER\Desktop\실전프로젝트\back\IP_Project\Python\api_key.txt", "r") as f:
            api_key = f.read().strip()
    except FileNotFoundError:
        return []

    # NewsAPI 엔드포인트
    url = f"https://newsapi.org/v2/everything?q={query}&language=ko&pageSize=10&apiKey={api_key}"

    try:
        response = requests.get(url)
        news_data = response.json()

        articles = []
        if news_data.get("articles"):
            for article in news_data['articles']:
                articles.append({
                    'title': article.get('title', '제목 없음'),
                    'description': article.get('description', '내용 없음').strip(),
                    'date': article.get('publishedAt', '')[:10],
                    'url': article.get('url', '#'),
                    'image_url': article.get('urlToImage', None)
                })
        return articles
    except Exception as e:
        print(f"Error fetching news: {e}")
        return []

@app.route('/search', methods=['GET'])
def search():
    corp_name = request.args.get('query', '')
    if corp_name:
        articles = get_news(corp_name)
        return render_template('corp.html', articles=articles)
    return render_template('corp.html', articles=[])

if __name__ == '__main__':
    app.run(debug=True)