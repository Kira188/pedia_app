const maleCsvData = '''Months,-3 SD,-2 SD,-1 SD,Median,1 SD,2 SD,3 SD
120,12.8,13.7,14.9,16.4,18.5,21.4,26.1
121,12.8,13.8,15.0,16.5,18.5,21.5,26.2
122,12.8,13.8,15.0,16.5,18.6,21.6,26.4
123,12.9,13.8,15.0,16.5,18.7,21.7,26.6
124,12.9,13.9,15.1,16.7,18.8,21.7,26.7
125,12.9,13.9,15.1,16.7,18.8,21.8,26.9
126,12.9,13.9,15.1,16.7,18.9,21.8,27.2
127,12.9,13.9,15.1,16.7,18.9,22.0,27.2
128,13.0,14.0,15.2,16.8,19.0,22.0,27.4
129,13.0,14.0,15.2,16.8,19.1,22.1,27.5
130,13.0,14.0,15.2,16.9,19.2,22.1,27.7
131,13.0,14.1,15.2,16.9,19.3,22.3,27.9
132,13.1,14.1,15.3,17.0,19.3,22.5,28.0
133,13.1,14.1,15.4,17.0,19.4,22.6,28.3
134,13.1,14.1,15.4,17.0,19.5,22.7,28.5
135,13.1,14.2,15.4,17.1,19.6,22.7,28.7
136,13.2,14.2,15.5,17.1,19.6,22.8,28.7
137,13.2,14.2,15.5,17.1,19.6,22.8,28.7
138,13.2,14.3,15.5,17.2,19.7,22.9,28.8
139,13.2,14.3,15.5,17.2,19.7,23.0,29.0
140,13.3,14.3,15.6,17.3,19.8,23.1,29.2
141,13.3,14.4,15.6,17.3,19.9,23.2,29.5
142,13.3,14.4,15.6,17.4,19.9,23.3,29.6
143,13.4,14.4,15.7,17.4,20.0,23.4,29.7
144,13.4,14.5,15.7,17.5,20.0,23.5,29.8
145,13.5,14.5,15.8,17.6,20.1,23.6,30.1
146,13.5,14.5,15.8,17.6,20.2,23.8,30.3
147,13.5,14.6,15.9,17.7,20.2,23.9,30.3
148,13.5,14.6,15.9,17.8,20.3,24.0,30.7
149,13.6,14.6,16.0,17.9,20.4,24.2,30.9
150,13.6,14.7,16.1,17.9,20.4,24.2,30.9
151,13.6,14.7,16.1,17.9,20.4,24.3,31.0
152,13.7,14.8,16.2,18.0,20.5,24.4,31.1
153,13.7,14.8,16.2,18.0,20.6,24.5,31.3
154,13.7,14.8,16.3,18.0,20.7,24.6,31.4
155,13.7,14.9,16.3,18.1,20.7,24.7,31.6
156,13.8,14.9,16.4,18.2,20.8,24.7,31.7
157,13.8,15.0,16.4,18.3,20.9,24.8,31.9
158,13.9,15.0,16.5,18.4,21.0,25.0,31.9
159,13.9,15.0,16.5,18.5,21.0,25.1,32.1
160,14.0,15.1,16.5,18.5,21.1,25.2,32.3
161,14.0,15.1,16.6,18.6,21.2,25.2,32.3
162,14.0,15.2,16.6,18.6,21.2,25.3,32.4
163,14.1,15.2,16.6,18.7,21.4,25.4,32.6
164,14.1,15.2,16.7,18.7,21.5,25.6,32.7
165,14.1,15.3,16.7,18.8,21.5,25.7,32.8
166,14.1,15.3,16.8,18.8,21.6,25.8,32.8
167,14.2,15.4,16.8,18.8,21.6,25.8,32.8
168,14.2,15.4,16.9,18.9,21.8,25.9,33.1
169,14.2,15.4,16.9,19.1,21.8,26.0,33.1
170,14.3,15.5,17.0,19.1,21.8,26.1,33.3
171,14.3,15.5,17.0,19.1,21.9,26.2,33.3
172,14.3,15.5,17.1,19.2,22.0,26.2,33.4
173,14.4,15.6,17.2,19.2,22.0,26.3,33.4
174,14.4,15.6,17.2,19.3,22.1,26.4,33.5
175,14.5,15.7,17.3,19.3,22.2,26.4,33.7
176,14.5,15.7,17.3,19.4,22.2,26.5,33.7
177,14.5,15.7,17.3,19.4,22.2,26.6,33.7
178,14.6,15.8,17.4,19.5,22.3,26.7,33.9
179,14.6,15.8,17.5,19.5,22.4,26.7,34.1
180,14.6,15.9,17.5,19.6,22.5,26.8,34.3
181,14.7,16.1,17.7,19.8,22.8,27.1,34.1
182,14.8,16.1,17.8,19.9,22.8,27.1,34.2
183,14.8,16.2,17.9,20.0,22.9,27.2,34.3
184,14.8,16.2,17.9,20.0,23.0,27.3,34.3
185,14.9,16.2,17.9,20.1,23.0,27.4,34.4
186,14.9,16.3,18.0,20.1,23.2,27.4,34.5
187,15.0,16.3,18.0,20.3,23.2,27.5,34.5
188,15.0,16.3,18.1,20.3,23.3,27.6,34.6
189,15.0,16.4,18.2,20.4,23.4,27.7,34.7
190,15.0,16.4,18.2,20.4,23.4,27.7,34.7
191,15.1,16.5,18.2,20.4,23.5,27.8,34.7
192,15.1,16.5,18.2,20.5,23.5,27.9,34.8
193,15.1,16.5,18.3,20.5,23.6,27.9,34.8
194,15.2,16.6,18.3,20.6,23.6,27.9,34.9
195,15.2,16.6,18.4,20.7,23.7,28.0,34.9
196,15.2,16.8,18.4,20.7,23.7,28.0,34.9
197,15.3,16.8,18.5,20.7,23.8,28.1,35.0
198,15.3,16.8,18.5,20.8,23.9,28.2,35.0
199,15.3,16.8,18.6,20.9,24.0,28.3,35.0
200,15.3,16.8,18.6,20.9,24.0,28.4,35.0
201,15.4,16.9,18.7,21.0,24.1,28.5,35.1
202,15.4,16.9,18.7,21.0,24.2,28.5,35.2
203,15.4,16.9,18.7,21.1,24.2,28.6,35.2
''';


const femaleCsvData = '''Month,-3 SD,-2 SD,-1 SD,Median,1 SD,2 SD,3 SD
121,12.4,13.5,14.9,16.7,19.1,22.7,28.4
122,12.4,13.5,14.9,16.7,19.2,22.8,28.7
123,12.5,13.6,15.0,16.8,19.3,22.9,28.8
124,12.5,13.6,15.0,16.9,19.4,23.0,29.0
125,12.5,13.6,15.0,16.9,19.5,23.1,29.1
126,12.6,13.7,15.1,17.0,19.5,23.2,29.3
127,12.6,13.7,15.1,17.0,19.6,23.2,29.6
128,12.6,13.7,15.2,17.1,19.7,23.3,29.7
129,12.7,13.8,15.2,17.1,19.7,23.3,29.8
130,12.7,13.8,15.3,17.2,19.8,23.4,29.9
131,12.7,13.8,15.3,17.2,19.8,23.5,30.0
132,12.7,13.9,15.4,17.3,19.9,23.5,30.2
133,12.8,13.9,15.4,17.3,19.9,23.6,30.5
134,12.8,14.0,15.4,17.4,20.0,23.9,30.9
135,12.9,14.0,15.5,17.4,20.0,24.0,31.2
136,12.9,14.0,15.5,17.5,20.1,24.1,31.4
137,12.9,14.1,15.6,17.5,20.2,24.2,31.6
138,12.9,14.1,15.6,17.6,20.2,24.2,31.8
139,13.0,14.2,15.7,17.7,20.4,24.5,32.0
140,13.0,14.2,15.7,17.7,20.4,24.5,32.1
141,13.0,14.3,15.8,17.8,20.4,24.6,32.4
142,13.1,14.3,15.8,17.9,20.5,24.8,32.7
143,13.1,14.3,15.9,17.9,20.6,24.9,32.9
144,13.1,14.4,15.9,18.0,20.7,25.1,33.0
145,13.2,14.4,16.0,18.1,20.9,25.1,33.2
146,13.2,14.4,16.0,18.1,20.9,25.1,33.5
147,13.3,14.5,16.1,18.2,21.1,25.3,33.8
148,13.3,14.6,16.2,18.3,21.1,25.4,34.0
149,13.4,14.7,16.2,18.4,21.3,25.5,34.2
150,13.4,14.7,16.3,18.5,21.3,25.6,34.4
151,13.4,14.7,16.3,18.5,21.4,25.7,32.8
152,13.5,14.8,16.4,18.6,21.5,25.8,33.0
153,13.5,14.8,16.4,18.6,21.6,25.9,33.2
154,13.5,14.8,16.4,18.7,21.6,26.0,33.3
155,13.6,14.9,16.5,18.7,21.7,26.0,33.4
156,13.6,14.9,16.6,18.8,21.7,26.1,33.5
157,13.6,15.0,16.6,18.8,21.7,26.1,33.6
158,13.6,15.0,16.7,18.9,21.8,26.2,33.7
159,13.6,15.0,16.7,18.9,21.9,26.3,33.8
160,13.7,15.1,16.7,19.0,21.9,26.3,34.0
161,13.7,15.1,16.8,19.0,21.9,26.4,34.1
162,13.7,15.1,16.8,19.0,22.0,26.5,34.2
163,13.8,15.2,16.8,19.1,22.0,26.5,34.3
164,13.8,15.2,16.9,19.1,22.0,26.6,34.4
165,13.8,15.3,16.9,19.1,22.0,26.6,34.5
166,13.8,15.3,17.0,19.2,22.1,26.7,34.7
167,13.8,15.3,17.0,19.2,22.1,26.8,34.8
168,13.9,15.4,17.0,19.2,22.2,26.8,34.9
169,13.9,15.4,17.1,19.3,22.2,26.9,35.0
170,14.0,15.5,17.1,19.3,22.3,26.9,35.1
171,14.0,15.5,17.2,19.4,22.3,27.0,35.2
172,14.0,15.5,17.2,19.4,22.3,27.0,35.3
173,14.1,15.6,17.3,19.5,22.4,27.1,35.4
174,14.1,15.6,17.3,19.5,22.4,27.1,35.5
175,14.1,15.7,17.3,19.5,22.4,27.1,35.7
176,14.2,15.7,17.4,19.6,22.5,27.2,35.8
177,14.2,15.7,17.4,19.6,22.5,27.3,35.9
178,14.2,15.7,17.4,19.6,22.5,27.3,36.0
179,14.2,15.7,17.5,19.6,22.5,27.3,36.2
180,14.3,15.8,17.5,19.7,22.6,27.4,36.3
181,14.4,15.9,17.8,20.3,23.6,28.3,35.6
182,14.4,15.9,17.8,20.3,23.6,28.4,35.7
183,14.4,16.0,17.9,20.4,23.7,28.4,35.7
184,14.5,16.0,17.9,20.4,23.7,28.5,35.8
185,14.5,16.0,18.0,20.4,23.8,28.5,35.8
186,14.5,16.1,18.0,20.5,23.9,28.6,35.8
187,14.5,16.1,18.1,20.5,23.9,28.6,35.9
188,14.5,16.1,18.1,20.6,24.0,28.7,36.0
189,14.6,16.1,18.1,20.6,24.0,28.7,36.0
190,14.6,16.1,18.1,20.6,24.0,28.8,36.0
191,14.6,16.2,18.1,20.7,24.1,28.8,36.3
192,14.6,16.2,18.2,20.7,24.1,28.9,36.1
193,14.7,16.2,18.2,20.7,24.2,28.9,36.1
194,14.7,16.3,18.2,20.8,24.2,28.9,36.1
195,14.7,16.3,18.3,20.8,24.3,29.0,36.1
196,14.7,16.3,18.3,20.9,24.3,29.1,36.2
197,14.7,16.3,18.3,20.9,24.3,29.1,36.2
198,14.7,16.4,18.4,20.9,24.3,29.1,36.3
199,14.7,16.4,18.4,21.0,24.4,29.2,36.3
200,14.7,16.4,18.4,21.0,24.4,29.2,36.3
201,14.7,16.4,18.4,21.0,24.4,29.2,36.3
202,14.7,16.4,18.4,21.0,24.4,29.3,36.3
203,14.7,16.4,18.4,21.0,24.5,29.3,36.3
''';
class SdcData {
  static final maleMap = _parseCsvToMap(maleCsvData);
  static final femaleMap = _parseCsvToMap(femaleCsvData);
  
  static Map<int, List<double>> _parseCsvToMap(String csvData) {
    final lines = csvData.trim().split('\n');
    final Map<int, List<double>> resultMap = {};

    // Start from index 1 to skip the header line
    for (int i = 1; i < lines.length; i++) {
      final values = lines[i].split(',');
      final month = int.parse(values[0].trim());
      final sdValues = values.sublist(1).map((value) => double.parse(value.trim())).toList();
      resultMap[month] = sdValues;
    }

    return resultMap;
  }
}