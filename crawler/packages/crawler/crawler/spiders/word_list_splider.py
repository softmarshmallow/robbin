import scrapy

VOCABULARY_COM_LISTS_WORDSMART = "https://www.vocabulary.com/lists/330127"


class WordListSpider(scrapy.Spider):
    name = "word_lists"

    def start_requests(self):
        urls = [VOCABULARY_COM_LISTS_WORDSMART]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        words = []
        item_xpath = """//*[@class="entry learnable"]"""
        token_xpath = """a/text()"""
        definition_xpath = """div[@class="definition"]/text()"""

        items = response.xpath(item_xpath)
        for item in items:
            token = item.xpath(token_xpath).get()
            definition = item.xpath(definition_xpath).get()
            words.append({
                "token": token,
                "definition": definition
            })
        return words
