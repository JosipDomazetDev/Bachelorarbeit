from io import StringIO

import pandas as pd


def analyze_flutter_output(filename):
    print("Analyzing file:", filename)
    with open(filename, 'r') as file:
        data = file.read()
        output_data = StringIO(data)

        df = pd.read_csv(output_data, sep=" - ", engine="python", names=["Severity", "Message", "Location", "Rule"])

        summary_table = df.groupby(['Severity', 'Rule']).size().reset_index(name='Count')

        print(summary_table)

        total_info = (df['Severity'] == 'info').sum()
        total_warning = (df['Severity'] == 'warning').sum()
        print("\nTotal 'warning' entries:", total_warning)
        print("Total 'info' entries:", total_info)

        total_unique_issues = df['Rule'].nunique()
        print("Total unique issues:", total_unique_issues)


analyze_flutter_output('./gemini')
print("\n")
analyze_flutter_output('./chatgpt3')
print("\n")
analyze_flutter_output('./chatgpt4')
print("===========" * 50)
print("\n")
analyze_flutter_output('./gemini_dart_fix')
print("\n")
analyze_flutter_output('./chatgpt3_dart_fix')
print("\n")
analyze_flutter_output('./chatgpt4_dart_fix')
