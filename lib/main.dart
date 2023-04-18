import 'dart:convert';
import 'dart:developer';

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: MaterialButton(onPressed: ()=>parseJson(),color: Colors.blue,child: const Text('Parse Json',style: TextStyle(color: Colors.white),),),
      ),
    );
  }
  parseJson() async {
    const r  = r'''
    {"resourceType":"Bundle","id":"034e77b3-3aa5-4928-9ffb-7dbbf3b4c1a5","meta":{"lastUpdated":"2023-04-07T08:34:43.884+00:00"},"type":"searchset","total":2,"link":[{"relation":"self","url":"http://3.239.201.122/openmrs/ws/fhir2/R4/Condition?patient.identifier=GAN203006"}],"entry":[{"fullUrl":"http://3.239.201.122/openmrs/ws/fhir2/R4/Condition/f5d34909-5aac-4a30-925e-07e64d03c61d","resource":{"resourceType":"Condition","id":"f5d34909-5aac-4a30-925e-07e64d03c61d","meta":{"lastUpdated":"2017-05-05T16:00:08.000+00:00"},"text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>f5d34909-5aac-4a30-925e-07e64d03c61d</td></tr><tr><td>Clinical Status:</td><td> Active </td></tr><tr><td>Code:</td><td>Hyperthyroidism, NOS</td></tr><tr><td>Subject:</td><td><a href=\"http://localhost:8080/openmrs/ws/fhir2/R4/Patient/1dfff08c-141b-46df-b6a2-6b69080a5000\">Test Thermometer (Patient Identifier: GAN203006)</a></td></tr><tr><td>Onset:</td><td> 05 May 2017 00:00:00 </td></tr><tr><td>Recorded Date:</td><td>05/05/2017</td></tr><tr><td>Recorder:</td><td><a href=\"http://localhost:8080/openmrs/ws/fhir2/R4/Practitioner/c1c21e11-3f10-11e4-adec-0800271c1b75\">Sncho Admin</a></td></tr></tbody></table></div>"},"clinicalStatus":{"coding":[{"system":"http://terminology.hl7.org/CodeSystem/condition-clinical","code":"active","display":"Active"}]},"code":{"coding":[{"code":"de617543-4e14-11e4-8a57-0800271c1b75","display":"Hyperthyroidism, NOS"}],"text":"Hyperthyroidism, NOS"},"subject":{"reference":"Patient/1dfff08c-141b-46df-b6a2-6b69080a5000","type":"Patient","display":"Test Thermometer (Patient Identifier: GAN203006)"},"onsetDateTime":"2017-05-05T00:00:00+00:00","recordedDate":"2017-05-05T16:00:08+00:00","recorder":{"reference":"Practitioner/c1c21e11-3f10-11e4-adec-0800271c1b75","type":"Practitioner","display":"Sncho Admin"}}},{"fullUrl":"http://3.239.201.122/openmrs/ws/fhir2/R4/Condition/822d31c5-8961-4ddc-891b-75586763eb08","resource":{"resourceType":"Condition","id":"822d31c5-8961-4ddc-891b-75586763eb08","meta":{"lastUpdated":"2023-04-07T05:43:32.000+00:00"},"text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>822d31c5-8961-4ddc-891b-75586763eb08</td></tr><tr><td>Clinical Status:</td><td> Active </td></tr><tr><td>Code:</td><td>Anemia, pernicious</td></tr><tr><td>Subject:</td><td><a href=\"http://localhost:8080/openmrs/ws/fhir2/R4/Patient/1dfff08c-141b-46df-b6a2-6b69080a5000\">Test Thermometer (Patient Identifier: GAN203006)</a></td></tr><tr><td>Onset:</td><td> 05 April 2023 18:15:00 </td></tr><tr><td>Recorded Date:</td><td>07/04/2023</td></tr><tr><td>Recorder:</td><td><a href=\"http://localhost:8080/openmrs/ws/fhir2/R4/Practitioner/c1c21e11-3f10-11e4-adec-0800271c1b75\">Sncho Admin</a></td></tr></tbody></table></div>"},"clinicalStatus":{"coding":[{"system":"http://terminology.hl7.org/CodeSystem/condition-clinical","code":"active","display":"Active"}]},"code":{"coding":[{"code":"e0581701-4e14-11e4-8a57-0800271c1b75","display":"Anemia, pernicious"}],"text":"Anemia, pernicious"},"subject":{"reference":"Patient/1dfff08c-141b-46df-b6a2-6b69080a5000","type":"Patient","display":"Test Thermometer (Patient Identifier: GAN203006)"},"onsetDateTime":"2023-04-05T18:15:00+00:00","recordedDate":"2023-04-07T05:43:32+00:00","recorder":{"reference":"Practitioner/c1c21e11-3f10-11e4-adec-0800271c1b75","type":"Practitioner","display":"Admin"}}}]}
    ''';
    log('Json String ======> $r');
    try {
      final Bundle response =
      Bundle.fromJson(jsonDecode(r) as Map<String, dynamic>);

      log('Bundle response =====> ${response.toJson()}');
    } catch (e, s) {
      print('Error: $e, Stack: $s');
    }
  }
}

