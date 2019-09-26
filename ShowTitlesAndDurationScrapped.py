import json

def Show_Titles(kwargs):
    titleList = kwargs['showTitleList']
    durationList = kwargs['showTitleDuration']
    print(titleList)
    print('Here')
    print(durationList)
    ShowTitlesAndDuration = dict(zip(titleList, durationList))
    jsonWrt = json.dumps(ShowTitlesAndDuration)
    f = open("ShowTitlesAndDuration.json","w")
    f.write(jsonWrt)
    f.close()

