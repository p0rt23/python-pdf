import textract

text = textract.process("sample.pdf")
print(text.decode("UTF-8"))
