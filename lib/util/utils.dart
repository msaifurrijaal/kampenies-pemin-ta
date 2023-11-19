String careerPathEmployee(String division) {
  String careerPath = '';
  if (division == 'Marketing') {
    careerPath =
        'Marketing Executive, Marketing Manager, Marketing Director, Chief Marketing Officer (CMO)';
  } else if (division == 'Accounting') {
    careerPath =
        'Accounting Clerk, Accounting Assistant, Accounting Associate, Accounting Manager, Chief Financial Officer (CFO)';
  } else if (division == 'IT') {
    careerPath =
        'Software Engineer, Web Developer, Database Administrator, Information Security Analyst, Chief Information Officer (CIO)';
  } else if (division == 'Administration') {
    careerPath =
        'Office Assistant, Administrative Assistant, Executive Assistant, Human Resources Manager, Chief Human Resources Officer (CHRO)';
  } else if (division == 'Engineering') {
    careerPath =
        'Engineer Trainee, Junior Engineer, Senior Engineer, Lead Engineer, Principal Engineer, Engineering Manager, Director of Engineering, Vice President of Engineering, Chief Engineer';
  }
  return careerPath;
}
