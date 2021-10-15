from junitparser import JUnitXml
from mdutils.mdutils import MdUtils
import sys 

URL=sys.argv[3]
SUITENAME=sys.argv[2]
FILEPATH=sys.argv[1]

mdFile = MdUtils(file_name='converted',title=f'{SUITENAME}')

mdFile.new_paragraph(f"Please find the detailed report here {URL}")

xml = JUnitXml.fromfile(FILEPATH)
for suite in xml:
    mdFile.new_header(level=2, title=" 🟥 Testsuite: "+suite.name+ f" [{max(suite.tests-suite.failures,0)} / {suite.tests}]",add_table_of_contents='n')  # style is set 'atx' format by default.   
    caseList=[]
    for case in suite:
        caseList.append(" 🟩 [time: "+str(case.time)+"] Scenario: "+case.name)
    mdFile.new_list(items=caseList)   # style is set 'atx' format by default.   

mdFile.create_md_file()