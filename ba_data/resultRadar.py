import matplotlib.pyplot as plt
import numpy as np

tools = ['ChatGPT4.0', 'ChatGPT3.5', 'Gemini']
total_lines = np.array([523, 361, 336])

percentage_of_test_lines = np.array([48.76, 24.65, 28.27])
test_coverage = np.array([95.3, 82.9, 85.8])

change_rate = np.array([33.27, 14.96, 48.51])

correct_approach_rate = np.array([100, 75, 50])
deployable_solutions_rate = np.array([75, 0, 25])

unique_problems_data = np.array([2, 1, 4])
max_unique_problems = np.max(unique_problems_data)
best_practices_score = 100 * (1 - unique_problems_data / max_unique_problems)

# Normalize total lines of code to percentage
total_lines_normalized = (total_lines / max(total_lines)) * 100  # This makes the max value 100%

# Compute values for the radar chart
values = np.array([
    [total_lines_normalized[0], (percentage_of_test_lines[0] + test_coverage[0]) / 2,
     (correct_approach_rate[0] + deployable_solutions_rate[0]) / 2, 100 - change_rate[0], best_practices_score[0]],
    [total_lines_normalized[1], (percentage_of_test_lines[1] + test_coverage[1]) / 2,
     (correct_approach_rate[1] + deployable_solutions_rate[1]) / 2, 100 - change_rate[1], best_practices_score[1]],
    [total_lines_normalized[2], (percentage_of_test_lines[2] + test_coverage[2]) / 2,
     (correct_approach_rate[2] + deployable_solutions_rate[2]) / 2, 100 - change_rate[2], best_practices_score[2]]
])

# Labels for the radar chart
labels = np.array(
    ['Codegenerierung', 'Testgenerierung', 'Problemkompetenz', 'Selbstständigkeit', 'Flutter-Richtlinien'])

# Compute angle for each axis
num_vars = len(labels)
angles = np.linspace(0, 2 * np.pi, num_vars, endpoint=False).tolist()
angles += angles[:1]  # repeat the first value to close the circle

# Plotting
fig, ax = plt.subplots(figsize=(8, 8), subplot_kw=dict(polar=True))
ax.set_theta_offset(np.pi / 2)
ax.set_theta_direction(-1)

# Draw one axe per variable and add labels
plt.xticks(angles[:-1], labels)

# Draw ylabels
ax.set_rlabel_position(0)
ax.set_ylim(0, 100)

# Plot data
colors = ['red', 'green', 'blue']
for i in range(len(tools)):
    ax.plot(angles, np.concatenate([values[i], values[i][:1]]), linewidth=2, linestyle='solid', label=f'{tools[i]}',
            color=colors[i])
    ax.fill(angles, np.concatenate([values[i], values[i][:1]]), color=colors[i], alpha=0.1)

ax.legend(loc='upper right', bbox_to_anchor=(0.08, 0.02))
ax.set_title('Vergleich der Leistungsfähigkeit von ChatGPT4.0, ChatGPT3.5 und Gemini (%)', pad=20)
plt.savefig('radar.png', dpi=300)

plt.show()
