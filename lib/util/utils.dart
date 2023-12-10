String careerPathEmployee(String division) {
  String careerPath = '';
  if (division == 'Sales and Marketing') {
    careerPath =
        'Marketing Executive, Marketing Manager, Marketing Director, Chief Marketing Officer (CMO).';
  } else if (division == 'Human Resource Development') {
    careerPath =
        'HR Assistant, HR Coordinator, HR Generalist, HR Specialist, HR Supervisor, HR Manager, HR Director, Chief Human Resources Officer (CHRO).';
  } else if (division == 'Information Technology') {
    careerPath =
        'Software Engineer, Web Developer, Database Administrator, Information Security Analyst, Chief Information Officer (CIO).';
  } else if (division == 'Finance') {
    careerPath =
        'Finance Assistant, Junior Accountant, Accountant, Senior Accountant, Finance Manager, Finance Director, Chief Financial Officer (CFO).';
  } else if (division == 'Engineering') {
    careerPath =
        'Engineer Trainee, Junior Engineer, Senior Engineer, Lead Engineer, Principal Engineer, Engineering Manager, Director of Engineering, Vice President of Engineering, Chief Engineer';
  } else if (division == 'Mining') {
    careerPath =
        'Junior Mining Engineer, Mining Engineer, Senior Mining Engineer, Mining Supervisor, Mining Manager, Mining Director';
  } else if (division == 'Legal') {
    careerPath =
        'Junior Legal Staff, Legal Staff, Senior Legal Staff, Legal Supervisor, Legal Manager, Legal Director, Chief Legal Officer (CLO)';
  }
  return careerPath;
}
