class Task {
  String text;
  String project;
  String color;
  int priority;

  Task({
    required this.text,
    required this.project,
    required this.color,
    required this.priority,
  });

  // Setter function for 'text'
  void setText(String newText) {
    text = newText;
  }

  // Getter function for 'text'
  String getText() {
    return text;
  }

  // Setter function for 'project'
  void setProject(String newProject) {
    project = newProject;
  }

  // Getter function for 'project'
  String getProject() {
    return project;
  }

  // Setter function for 'color'
  void setColor(String newColor) {
    color = newColor;
  }

  // Getter function for 'color'
  String getColor() {
    return color;
  }

  // Setter function for 'priority'
  void setPriority(int newPriority) {
    priority = newPriority;
  }

  // Getter function for 'priority'
  int getPriority() {
    return priority;
  }
}
