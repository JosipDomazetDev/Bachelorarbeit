import matplotlib.pyplot as plt
import numpy as np

# Data setup
tools = ['ChatGPT4.0', 'ChatGPT3.5', 'Gemini']
percentage_of_test_lines = np.array([48.76, 24.65, 28.27])
test_coverage = np.array([95.3, 82.9, 85.8])
change_rate = np.array([33.27, 14.96, 48.51])  # Lower is better, so we take the complement to 100
correct_approach_rate = np.array([100, 75, 50])
deployable_solutions_rate = np.array([75, 0, 25])

# Calculate the complement of change rate to align with others (higher is better)
change_rate_complement = 100 - change_rate

# Calculate average percentage for each tool
average_percentages = (percentage_of_test_lines + test_coverage + change_rate_complement + correct_approach_rate + deployable_solutions_rate) / 5

# Plotting the average percentage scores
fig, ax = plt.subplots()
rects = ax.bar(tools, average_percentages, color=['red', 'green', 'blue'])

ax.set_ylabel('Average Percentage Score')
ax.set_title('Overall Performance of Tools Based on Percentages')
ax.set_xticks(np.arange(len(tools)))
ax.set_xticklabels(tools)
ax.bar_label(rects, padding=3, fmt='%.2f')  # Formatting the bar labels to show two decimal places

plt.show()
