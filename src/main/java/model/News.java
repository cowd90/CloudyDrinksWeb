package model;

public class News {
    private int newsId;
    private String title;
    private String img;
    private String content;
    private String hashtag;

    public News() {
    }

    public News(int newsId, String title, String img, String content, String hashtag) {
        this.newsId = newsId;
        this.title = title;
        this.img = img;
        this.content = content;
        this.hashtag = hashtag;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", title='" + title + '\'' +
                ", img='" + img + '\'' +
                ", content='" + content + '\'' +
                ", hashtag='" + hashtag + '\'' +
                '}';
    }
}
