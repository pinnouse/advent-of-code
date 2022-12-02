calories = []
with open('input.txt') as f:
    running = 0
    for line in f:
        line = line.strip()
        if len(line) == 0:
            calories.append(running)
            running = 0
        else:
            running += int(line)

calories.sort(reverse=True)
print(sum(calories[:3]))
