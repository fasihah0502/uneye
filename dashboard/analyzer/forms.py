from django import forms

class SentimentForm(forms.Form):
    brand = forms.CharField(label='Brand', max_length=100)
    sentence = forms.CharField(widget=forms.Textarea(attrs={"rows": 4, "cols": 50}))

class DataForm(forms.Form):
    brand = forms.CharField(label='Brand', max_length=100)
    sentence = forms.CharField(label='Enter your sentence', max_length=255)
    
class UploadFileForm(forms.Form):
    file = forms.FileField(label='Select a CSV file')