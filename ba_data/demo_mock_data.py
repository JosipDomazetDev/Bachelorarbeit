import numpy as np
import matplotlib.pyplot as plt
# This was used a sample data for illustration purposes

# Sample data: attempts needed for each problem by each model
problems = ['Problem 1', 'Problem 2', 'Problem 3', 'Problem 4', 'Problem 5', 'Problem 6', 'Problem 7', 'Problem 8', 'Problem 9', 'Total']
chatgpt_3_5_attempts = [10, 8, 7, 9, 5, 6, 8, 10, 7, 70]  # Adjusted total for illustration
chatgpt_4_attempts = [5, 6, 3, 4, 2, 3, 4, 5, 3, 35]  # Adjusted total for illustration
gemini_attempts = [3, 20, 15, 10, 5, 7, 9, 6, 8, 83]  # Adjusted total for illustration

x = np.arange(len(problems))  # the label locations
width = 0.2  # the width of the bars

fig, ax = plt.subplots()
rects1 = ax.bar(x - width, chatgpt_3_5_attempts, width, label='ChatGPT-3.5', color='skyblue')
rects2 = ax.bar(x, chatgpt_4_attempts, width, label='ChatGPT-4', color='lightgreen')
rects3 = ax.bar(x + width, gemini_attempts, width, label='Gemini', color='salmon')

# Highlight the "Total" bars with a different color
rects1[-1].set_color('deepskyblue')
rects2[-1].set_color('olivedrab')
rects3[-1].set_color('firebrick')

# Add some text for labels, title, and custom x-axis tick labels
ax.set_xlabel('Problems')
ax.set_ylabel('Attempts Needed')
ax.set_title('Attempts Needed by Different AI Models to Solve Flutter App Problems')
ax.set_xticks(x)
ax.set_xticklabels(problems, rotation=45, ha='right')
ax.legend()

# Function to attach a text label above each bar, displaying its height
def autolabel(rects):
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')

autolabel(rects1)
autolabel(rects2)
autolabel(rects3)

fig.tight_layout()

plt.show()
