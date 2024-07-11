from wordcloud import WordCloud
import matplotlib.pyplot as plt
import chardet
import pandas as pd

# Read positive data
with open('../positive-words.csv','rb') as f:
    encoding = chardet.detect(f.read())['encoding']
positive_data = pd.read_csv('../positive-words.csv', encoding=encoding)

# Concatenate positive words
all_positive_words = positive_data.values.flatten().tolist()

# Create WordCloud object
positive_wordcloud = WordCloud(width = 800, height = 800, background_color ='white', stopwords = None, min_font_size = 10).generate(' '.join(all_positive_words))

# Plot WordCloud
plt.figure(figsize = (8, 8), facecolor = None)
plt.imshow(positive_wordcloud)
plt.axis("off")
plt.tight_layout(pad = 0)

plt.show()

# Read negative data
with open('../negative-words.csv','rb') as f:
    encoding = chardet.detect(f.read())['encoding']
negative_data = pd.read_csv('../negative-words.csv', encoding=encoding)

# Concatenate negative words
all_negative_words = negative_data.values.flatten().tolist()

# Create WordCloud object
negative_wordcloud = WordCloud(width = 800, height = 800, background_color ='white', stopwords = None, min_font_size = 10).generate(' '.join(all_negative_words))

# Plot WordCloud
plt.figure(figsize = (8, 8), facecolor = None)
plt.imshow(negative_wordcloud)
plt.axis("off")
plt.tight_layout(pad = 0)

plt.show()
