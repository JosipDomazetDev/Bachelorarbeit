import matplotlib.pyplot as plt
import numpy as np

# Data setup
tools = ['ChatGPT4.0', 'ChatGPT3.5', 'Gemini']
total_lines = np.array([523, 361, 336])
percentage_of_test_lines = np.array([48.76, 24.65, 28.27])
test_coverage = np.array([95.3, 82.9, 85.8])
change_rate = np.array([100 - 33.27, 100 - 14.96, 100 - 48.51])

unique_problems_data = np.array([2, 1, 4])
max_unique_problems = np.max(unique_problems_data)
unique_problems = 100 * (1 - unique_problems_data / max_unique_problems)

correct_approach_rate = np.array([100, 75, 50])
deployable_solutions_rate = np.array([75, 0, 25])

# Normalize total lines of code to percentage
total_lines_normalized = (total_lines / max(total_lines)) * 100  # This makes the max value 100%
# Invert negative metrics
max_unique_problems = max(unique_problems) + 1  # Add a buffer for scale

x = np.arange(len(tools))  # the label locations
width = 0.1  # the width of the bars

fig, ax = plt.subplots(figsize=(12, 6))  # single subplot

# Plotting all metrics
rects1 = ax.bar(x - 4 * width, total_lines_normalized, width, label='Zeilen')
rects2 = ax.bar(x - 3 * width, percentage_of_test_lines, width, label='Testzeilen (%)')
rects3 = ax.bar(x - 2 * width, test_coverage, width, label='Test Coverage (%)')
rects4 = ax.bar(x - width, change_rate, width, label='Selbstständigkeit (%)')
rects5 = ax.bar(x, unique_problems, width, label='Flutter-Richtlinien (%)')
rects6 = ax.bar(x + width, correct_approach_rate, width, label='F-Ansatzrate (%)')
rects7 = ax.bar(x + 2 * width, deployable_solutions_rate, width, label='F-Lösungsrate (%)')

ax.set_ylabel('Normalisierte Metriken (%)')
ax.set_title('Kombinierter Metrikvergleich von ChatGPT-Versionen und Gemini', pad=20)
ax.set_xticks(x)
ax.set_xticklabels(tools)
ax.legend(loc='upper left', bbox_to_anchor=(1, 1))

# Customizing bar labels to round and remove decimals
ax.bar_label(rects1, padding=3, labels=[f'{int(v)} Zeilen' for v in total_lines])
ax.bar_label(rects2, padding=3, labels=[f'{int(p)}' for p in percentage_of_test_lines])
ax.bar_label(rects3, padding=3, labels=[f'{int(t)}' for t in test_coverage])
ax.bar_label(rects4, padding=3, labels=[f'{int(c)}' for c in change_rate])
ax.bar_label(rects5, padding=3, labels=[f'{int(u)}' for u in unique_problems])
ax.bar_label(rects6, padding=3, labels=[f'{int(ca)}' for ca in correct_approach_rate])
ax.bar_label(rects7, padding=3, labels=[f'{int(ds)}' for ds in deployable_solutions_rate])

fig.tight_layout(rect=[0, 0, 1, 1])  # Adjust the layout to make room for the legend

plt.savefig('all.png', dpi=300)
plt.show()
