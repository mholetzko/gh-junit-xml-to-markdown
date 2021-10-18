from junitparser import JUnitXml
from mdutils.mdutils import MdUtils
import sys 

def getPassedFailedStr(hasFailures:bool)-> str:
    if hasFailures:
        return "📛"
    else:
        return "🏔️"



FILEPATH=sys.argv[1]
SUITENAME=sys.argv[2]
URL=sys.argv[3]

mdFile = MdUtils(file_name='converted',title=f'{SUITENAME}')

mdFile.new_paragraph(f"Please find the detailed report here {URL}")
# Most ugly piece of code I wrote in a while 😃
xml = JUnitXml.fromfile(FILEPATH)
for suite in xml:
    mdFile.new_header(level=3, title=f" {getPassedFailedStr(suite.failures>0)} Testsuite: "+suite.name+ f" [{max(suite.tests-suite.failures,0)} / {suite.tests}]",add_table_of_contents='n')  # style is set 'atx' format by default.   
    caseList=[]
    for case in suite:
        failingList = []
        for failures in case:
            print(failures.message)
            failingList.append(f" **[failure]:<br> "+str(failures.message)+"**")
        caseList.append(f" {getPassedFailedStr(len(failingList)>0)} [time: "+str(case.time)+"] Scenario: "+case.name)
        if len(failingList)>0:
            caseList.append(*failingList)

    mdFile.new_list(items=caseList)   # style is set 'atx' format by default.   

mdFile.create_md_file()