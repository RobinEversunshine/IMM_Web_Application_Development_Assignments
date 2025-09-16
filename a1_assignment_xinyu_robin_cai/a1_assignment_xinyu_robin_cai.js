let hospital = {
    "name":"hospital's name",
    "patientRecords":[
        {
            "id":"001",
            "name":"name1",
            "dateOfBirth":"20000101",
            "symptoms":["symptom1","symptom2","symptom3"]
        },
        {
            "id":"002",
            "name":"name2",
            "dateOfBirth":"20070206",
            "symptoms":["symptom1","symptom2"]
        },
        {
            "id":"003",
            "name":"name3",
            "dateOfBirth":"20031101",
            "symptoms":["symptom1"]
        }
    ]
};



function showPatients(hospitalData){
    let result = `<h1>${hospitalData.name}</h1>\n`;

    for (const patient of hospitalData.patientRecords) {

        let patientData = 
        `<h2>${patient.name}, ${patient.dateOfBirth} </h2>\n  <ul>\n`;

        for (const symptom of patient.symptoms) {
            patientData += `    <li>${symptom}</li>\n`;
        }

        patientData += `  </ul>\n`;
        result += patientData;
    }
    return result;
}



function getPatient(patientArray){
    let rand = Math.floor(Math.random()*patientArray.length);
    // console.log(rand);
    return patientArray[rand].id;
}



console.log("part 2");
console.log(showPatients(hospital));
console.log("\npart 3");
console.log(getPatient(hospital.patientRecords));