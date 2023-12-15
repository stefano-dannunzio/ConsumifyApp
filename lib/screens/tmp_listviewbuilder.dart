import 'package:flutter/material.dart';

class ListBuilderScreen2 extends StatefulWidget {
  @override
  State<ListBuilderScreen2> createState() => _ListBuilderScreen2State();
}

class _ListBuilderScreen2State extends State<ListBuilderScreen2> {
  final List _elements = [
    ['avatar1', 'Juan Pablo Segundo', 'Ingeniero', 42, true],
    ['avatar2', 'Juan Pablo', 'Ingeniero', 23, false],
    ['avatar3', 'Juan Pablo', 'Ingeniero', 44, false],
    ['avatar4', 'Juan Pablo', 'Ingeniero', 2, false],
    ['avatar5', 'Juan Pablo', 'Ingeniero', 2, false],
    ['avatar6', 'Juan Pablo', 'Ingeniero', 1, false],
    ['avatar7', 'Juan Pablo', 'Ingeniero', 4, false],
    ['avatar8', 'Juan Pablo', 'Ingeniero', 4, false],
    ['avatar9', 'Juan Pablo', 'Ingeniero', 52, false],
    ['avatar10', 'Juan Pablo', 'Ingeniero', 6, false],
    ['avatar11', 'Juan Pablo', 'Ingeniero', 7, false],
    ['avatar12', 'Juan Pablo', 'Ingeniero', 21, false],
    ['avatar13', 'Juan Pablo', 'Ingeniero', 9, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _elements.length,
          itemBuilder: (context, index) {
            return Container(
              height: 110,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 22, 78, 189),
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: Offset(0, 6))
                  ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Image.network('https://cdn-icons-png.flaticon.com/512/147/147133.png', width: 50, height: 50,),
                    GestureDetector(
                      child: Image.asset(
                        'assets/avatars/avatar${index + 1}.png',
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {
                        print('tap $index');
                        _elements[index][4] = !_elements[index][4];
                        setState(() {});
                      },
                      onLongPress: () {
                        print('long press $index');
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _elements[index][1],
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent.shade200,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            _elements[index][2],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        (!_elements[index][4])
                            ? Icon(Icons.star_border_outlined)
                            : Icon(Icons.star),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(_elements[index][3].toString())
                      ],
                    )
                  ]),
            );
          },
        ),
      ),
    );
  }
}
