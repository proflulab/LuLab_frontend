import 'package:flutter/material.dart';

class Train extends StatefulWidget {
  Train({Key? key}) : super(key: key);

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        body: new ListView(children: <Widget>[
          Container(
            height: 241,
            width: 375,
            color: Colors.grey,
            child: Stack(children: [
              new Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.33,
                  child: Container(
                    height: 241,
                    width: 375,
                    child: new Image.network(
                        'https://tse3-mm.cn.bing.net/th/id/OIP-C.TjUeHZd1Cs4TxjLBV9KqUAHaE8?pid=ImgDet&rs=1',
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              new Positioned(
                top: 97.0,
                left: 63.0,
                child: Container(
                    height: 36.0,
                    width: 36.0,
                    child: new Image.network(
                        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAsJCQcJCQcJCQkJCwkJCQkJCQsJCwsMCwsLDA0QDBEODQ4MEhkSJRodJR0ZHxwpKRYlNzU2GioyPi0pMBk7IRP/2wBDAQcICAsJCxULCxUsHRkdLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCz/wAARCADhANwDASIAAhEBAxEB/8QAGwABAAIDAQEAAAAAAAAAAAAAAAUGAwQHAQL/xABMEAABAwMCAwUEBAYNDQAAAAABAAIDBAUREiEGEzEHIkFRYRRxgZEVFjKhI0JScrHwFyQzNlRVgpSistHT8WJlc3WDhJKTs8HD0uH/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAMxEAAgECAwQIBQQDAAAAAAAAAAECAxEEEiETQVFhBRQxcZGSsdEyQoGhwSIkUvAzcrL/2gAMAwEAAhEDEQA/AOtoiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIi1a+WthpZ5KKmFTVANbBC6QRMc57g3U956NbnU7xwNt0JSu7GymQtGCK9CeOSpraN0AYQ+Cno3xlz8bOEsk7j/RWo+2X+aZzpOIZY6Z0j3iGjoqWF7WnOhgmk1uwNs7b48MqL8jRQi3ZyS8fYmdkyFAfRnF4yG8TsIwdJktNKX+mS14b79lE1Vk7RZcBvEsDmicyNwx9KcNwWk8lh9ctzjbxztRza3G8MPCTs6sV5vYuuQipbbZ2oNcHfT1tODnDowWn3j2dbsEXaTCwtlquHalxdq1zsqmOA/J/ANa3HwRT5MmWFiuypF/V+xaEUBL9ftREJ4aDcNwZBcC7OBnYHz6LwDj9z2Bz+GooyQHubHXyvaPEtaXNBPpkKc3Iz2Gl8y8SfRQsbeM/wACJZbDj2gsmcyGtz7PtiRgMmNZ37vQZ6nGDNKydzGcMm9PuPUXmV6pKBERAEREAREQBERAEREAREQBERAFG3Splp5bE1k3KbV3aKlmOlrjJGaeeQRjUDjUWtGf7VJKr8TSMbdOBYzI8Pde9YjAboc1segvceuRqAH5x8lWbsrnRh4bSpl7/Rn3xFVX6Os4eoLRVxUstxdXtkkmhZK0clkb2/bB8z4LHBRdokLZA672icuOQ6opZC5ndDcN5WkY8ehWW8/vi4H325l32/2MasaoleT1OiVXZUoKMVqm9Ur9rKr7F2kYx9OWrP5XsQz/AFcfcvtlJ2iMaGuutlkOpztclHJqII+z3C1uB4bKzorZFxZl1uT+WPlRVm0XaOA8G92lxcwtaXUW7D+W3S0DPvyPRZxB2ggAe3WA7Dc0lTv67SKxYTCZObIeKk/lj5UVwwdoJx+37CMHJxSVO4x0OXrDPQ9osxYWXm1QBoORT0jsOJ8Xc0PP6FacJhMi4hYqSd8sfKiqR0HaQxzXOvttkAIJZLRt0uA8DoY12PcQswpe0ISySfSVkIe2NoidS1HLZozuwB2rJzvlx6eCsuEwiglvZLxcn8sfKisQUnaHCwtddLNOdTnB9RSzF4BOdOYy0YHhslguF8dd7/abtVU1RJRR0s8T4IuVtMDkNAH2Rt13yflZ1XbSB9ZONjtnNo9+OQ9VaytWZrGrtYVM0V2bklvRYWPY8EtOQHPYfzmEtI39V9LxerU88IiIAiIgCIiAIiIAiIgCIiAKq8Xy09NLwjVShg5F/piXH7Yic1wfjxx0J9wVqVH7QXDk8PRxNkNc+4h1K6Jv4UNbpDmscN8klmPd6LOrpFndgI58RGPG/oyVvP74uBv9Jd/+jGrEq3eHMPEnBEeputrrs9zcjWGuhYASPI4Py9FZFMe1mdb/AB0+5/8ATK/xbdLjaLWyroTG2U1kEL3SMDw2NweT3TtuQB8Vo8P8aUV0dFR1zWUle/DYyCfZqhx2Ajc7cOPkT7ieidoEojscce2aivp2AejGvlP6Fz/hymbV3+xQPaXN9sbM4Dyp2un39MtCwqVJRqJI9jB4KjWwMqlRWavr3I7eiIuo+dCIiAIiIDwqt2mOM8UcaTafwjW2mIO32Y6FziPLqArIqfb6mqZxzxFSxtzTT0cE1QcDuSQsjbGc+upw/wAFnN2aOzDRcoVbfx/KLFBS1UV0uNSXxupaunow1pLhJHPBrY4Yxp0kEHOc5Hy31qR10MlfWW8NeJqampap7jp0OjqHSNbpIOcgsOcgLbV1bcc0811m4IIiKSgREQBERAEREAREQBERAFU+LqUSVXBtXJKWQ098pad7Wty9zqh7HtcHZ8CzB28fTe2Kp8dyyQWq2TxODZYL3QSxuIBDXtbIQSDss6nws7cDfrEUt+nirGK6S5454Wh5cYMdFPJzA38K/mc0aXO8m6e6PU+auCpdz/f9w2f83H3dajoroop9su8ti1aFL/X8s532jVWZLNRDHdZPVv3OoaiIm7dMbO/XrH8AUskl5kq9I5VPSVMYOe8JXmLoPLB+9a3HFT7RxBVs200kNPStx6N5pz65cfkrB2dQsEF0nGvW50UbtQAaO9Ie4evQNz/8XMv1Vj35ft+i0t7XqX5ERdx8iERaFdeLNbXQsr66np3zAujZK7vOaDguwMnHqobt2loxcnaKuzfRYoZ6epjZNTyxTRP3ZJC9r2O9zm7L4q6yjoaeWqq5mQwRDL3yHAGegAG5J8AFN95Ci28ttTYVOt0EUnHPE07gNdPQ0zY+8QRzgwOOkdfsgf47WC13i2XmGSegmMjY38uVr2OjkjfjIDmuHiNwoO1td9deLHYOkUNC0u8ATpIBPrg/JZSabj3ndQjKmqsZaPL+USVHFN9ZOIKgscIDQWina8ggOkYZ5HNbnrgOGfeptQ1NV1TuIrzROkJpobdbaiKMgdyWR0rHFp64OBkfqZlXjbcc9a91m4L0CIisYBERAEREAREQBERAEREAVI7RJ4xb7RSuzrnuTJm9dOiFuh2fD8cK7qj9odODS2SteNcdLXiKSLVoD2z6Xkam94fYxt5rKr8DPQ6Nt1qF/wC6GS5Oldxzw7gnkQ0skLQegldHLK7A9xblXPyVYusj3cTcHMLWBkb7iWFsmp5107SdbcbYwMbnPwU/XScmir5tWkRUtTJkbY0xudnKmGjZXENzjSXK33ZxG61ArLpdqofZnramRv5pkIb92F1Dgmn5FhpHkNzUOMxI6nutbv67H9TtyEdB7gux8HaBw3ZsSteTFK55BxpeZXksIO/d6fBcuH1m2fRdNrJhYwXZdL7FiRfOR+UPmF8Mngkc9kc0T3x45jWPa5zM9NQachd1z4+xlXP+0eaIR2Wn0sMr5KmYvwNbY2BrA0O64Jdn4LoC5d2hvzd6CPP7nbWOx5F80n9gWNd2gz1eiIZsXHld/Y3+zZsui/u1O5Ilo2Nb+JzdD3OcB54Lc/BSnH8jGWIMP2pq+lYzfxaHSE/IL64Bh5fD8chaAaitrZsjq4CTlAn/AIVX+0K4smq6C2RuB9ja6epwek0wAYw+obv/AClnfLROxRdfpVtbn6Ex2d05js9ZUkb1dwmLfzIWthH3hyxUb3t7Q7qwPcGyW9+toJ0vLWQFuodNt8Ka4QiEXDViaPx6YzH3yyOkP6VCUmP2Rbn/AKul/qU6m1owM3PaV8S3wf2aJykZJ9ab/Jofy/oq0x6y0hhfrndpDjsSp5eL1dCVjxqk87T5JeAREUmYREQBERAEREAREQBERAFXOLKaGsp7BSTBxhqeILdFKGEtcWFspIBG4VjUFxDnVwvg4P1kt2+cZHLmJCpP4Tpwraqpr+6GjdKZsfFXCVTqy+oNdHjDRoZBAMAEb76id17xzXyUdkfDGO9cJm0bnasaIy0yPOAc7gafj8813cx3EPBGlzTia8NOCDhwhjBBx4qRvFmoL5StpKzmBjZo5mPhIbKxzdjpcQeoyDt4/Klm1JI641IwlQnV1SXpJnDSWjqQPeQP0oMHcYIPluu3UvDnDdGxjILXRjSQ7XJE2WQuG2pz5AXE/FYqnhXhaqMjpbXTNc8Yc6AOhd1DtjER5frnfn6tLie2unqN7ODt9Di+PRbFFW1tuqI6uimdDPGdnM6OHi17ehafEFdZ+pPB38WD+cVX94vr6m8H6Qz6JhwC05L5i46XasFxfnHn59OiLDz4ky6cw0k4uLafJe5t2C7Nvdrpq8NDJHF8VRG0ktZNGdLw0nfHiPQqkdoVBUx11Jc8E0s1PHSOf4RTRue4Ncf8oHI9x+PRqalo6OMxUtPBBEXF5ZTxsjZqIAJ0sAGdgsksUM0b4po2SRvGHska17HDyLXDC6Zwzxys+ew+LWGxG2prTXTkcZt/EfElPSQ2W2zHEj3tp2U8TX1eZHF5bG7c9STnG3mPDFerLdrO6ikuTmulr43zOe17pNMwOXxySO6uGQSfXxxldjpbbaqJznUdDSU7nDDnU8EUbiPIlgBX1V0NBXxiKtpaepia8PayoiZI0OAxkBw6rLYNqzZ6a6ZhCrmp07J9vF/UqPZ4+udba5szan2UVDHUMkpcYXMLdL2waj0BG+Bjde0MFQ/j+91DI3GCnoRHNJsGsfNHCWN950n5K5sjjiYyONjGRsaGMYxoa1rRsA0DbCq9tq4YuMOKqJ2ebVw0NREcHBFPEGvb/SBV8uVRizjVd1p16sY2uvykS1PW1Ml9u1C5w9mprfbZ426QCJZ3zh51ddw1vy+cqommo5Ppy73B4e0Oo6ChgGkBj2M1zOfnqTl2Ph8pZaxvvPOq5brLwXoERFYyCIiAIiIAiIgCIiAIiIAsU1PTTmEzQxyGCVs8PMY13LlaCBIzPRwycH1WVEF7FLuFbLLxxw9QFsYho4ppoy0HW59TC4v1HOPxRjb9O1zVRuPD1/l4ibfKGst7eXExkLKuKUmMhhjLSI+o3Jzkdemy3hDx9/DrAP8AdKs/+RYxbTd0elXjTqQp5JJWjr29t23uLCir/J49/h9h/mdX/erzk8e5H7esGPE+x1eflzP+6vm5HNsF/Nff2LCiqEsvafGXCOmskwEj2AseW5aMYfiQjY+XXZY/au1EEardbC3fPKlhLhttgPlA+9RtOT8DVYJvXaR8xc0VHmuHalDyc2mhkMsjY28gsk0ucCcyESDA8z0WX2ntU/i+0f8AOZ/7qNpyfgW6i/5x8yLmipntPaltmgtGMjOmWMux6BzwPvW3K7tBBphTfRbxJHI+Z1VFyDA9pw2MtimkyT5g4U5+TKPCWds8fEs6o1Jj9kW6elul/qU63OZ2ncjm+z2Pm6sezh7+YG5xq155f9JQ0DeIrTfpeIr9bJjDLS1EUzrYGVDIsNjw6RrHZDcN3JKznK7Wm87MLQyRqfri24tJJ63LZSVj5uI77StqHPhpLdawYg4FkU73zufgDxI05+HkptUHgSarr7lxXc5W5bVSUwL+6BzNUj9AaPJpar8tKcs0bnHjaWxq7Pgl42QREWhxBERAEREAREQBERAEREAREQGGoZUPhkbTzCGU6dEpjEobggnLHEA56dUjbUAQ8yVry2Itl0xaOZJ3e+O8cDrtv167b5kQm+4LFKyd5iMU3LDXOMg0NfzGljmgd7pgkH4Y8VlRCCEdbOIHkE8SVTMADEFBb2tJ8yJGPOfiskVBxBCNJvvPGsv1VVvp3SYP4hMLmNx/Jz6qXRVyo2daTVtPBexG08N+1wvrK6iLWveZIaOiexr2YIaOZNM5w8CdvT35KyC6TOhNHXx0rGg8xrqRtQZN/Aue3HyW8imxTO7308EQJtHELi9zuKK4FxJaI6K3tY3PgAYycfFZTbL2NTY+Ia0MdExh5tJQyPa8DDpGP5YwT6ggfomUUZUaOvN8PBexW3cOXZ4aHcVXvDXNeNPszDlvTJawbei0JOCKmVr45eJbzJC/Z8cjg8OaTuHBzsfcrmiq6cX2mscdXj8LS+i9iGsFgo7BTTwQSSzPnl5s802kOeQNLQGt2AA/XdTKIrpJKyOapUlVk5zd2wiIpKBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAf/9k=')
                    //new Image.asset('image\logo白文.jpg', fit: BoxFit.fill)
                    ),
              ),
              new Positioned(
                top: 67.0,
                left: 28.0,
                child: Container(
                  height: 21.0,
                  width: 107.0,
                  child: new Text('Lu.lab训练营',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              new Positioned(
                top: 39.0,
                left: 139.0,
                child: Container(
                  height: 46.0,
                  width: 169.0,
                  child: new Text('XXXXXXXX我们的slogan'),
                ),
              ),
              new Positioned(
                  top: 8.0,
                  right: 11.0,
                  child: FlatButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("学员入口"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  )),
              new Positioned(
                top: 114.0,
                left: 11.0,
                child: Container(
                  height: 112.0,
                  width: 353.0,
                  color: Colors.white,
                  child: new Image.network(
                      'https://tse1-mm.cn.bing.net/th/id/R-C.bfe797a261a2868b5512885d71bbf210?rik=ElIOP9nIAQYgwQ&riu=http%3a%2f%2fwww.cvcc.net.cn%2fPublic%2fUploads%2farticle%2f58083d9741fa0.jpg&ehk=gXhsxcnG%2bMGhPetS5bwW2gmHvXTOR8fiFgmlD4VbW4I%3d&risl=&pid=ImgRaw&r=0',
                      fit: BoxFit.fill),
                ),
              ),
            ]),
          ),
          Container(
            height: 88,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 22.0,
                left: 26.0,
                child: Container(
                  height: 44.0,
                  width: 416.0,
                  child: new Text('Lu.lab训练营能学到什么',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              new Positioned(
                top: 48.0,
                right: 16.0,
                child: Container(
                  height: 22.0,
                  width: 80.0,
                  child: new Text('查看更多',
                      style: TextStyle(color: Colors.grey[600])),
                ),
              ),
            ]),
          ),
          Container(
            height: 678,
            width: 698,
            color: Colors.grey,
            margin: EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 36.0),
            // padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
            // decoration: new BoxDecoration(
            //     //容器背景装饰设置
            //     gradient: const LinearGradient(
            //         colors: [Colors.grey, Colors.grey, Colors.grey]),
            //     border: Border.all(width: 26.0, color: Colors.white) //容器外边框的设计
            //     ),
            child: Stack(children: [
              new Positioned(
                top: 22.0,
                left: 52.0,
                child: Container(
                  height: 82.0,
                  width: 144.0,
                  color: Colors.orange,
                ),
              ),
              new Positioned(
                top: 22.0,
                right: 26.0,
                child: Container(
                    height: 86.0,
                    width: 446.0,
                    padding: const EdgeInsets.fromLTRB(226.0, 0.0, 26.0, 0.0),
                    child: new Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3)),
              ),
              new Positioned(
                top: 158.0,
                left: 52.0,
                child: Container(
                  height: 82.0,
                  width: 144.0,
                  color: Colors.orange,
                ),
              ),
              new Positioned(
                top: 164.0,
                right: 26.0,
                child: Container(
                    height: 86.0,
                    width: 446.0,
                    padding: const EdgeInsets.fromLTRB(226.0, 0.0, 26.0, 0.0),
                    child: new Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3)),
              ),
              new Positioned(
                top: 304.0,
                left: 52.0,
                child: Container(
                  height: 82.0,
                  width: 144.0,
                  color: Colors.orange,
                ),
              ),
              new Positioned(
                top: 294.0,
                right: 26.0,
                child: Container(
                    height: 86.0,
                    width: 446.0,
                    padding: const EdgeInsets.fromLTRB(226.0, 0.0, 26.0, 0.0),
                    child: new Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3)),
              ),
              new Positioned(
                top: 438.0,
                left: 52.0,
                child: Container(
                  height: 82.0,
                  width: 144.0,
                  color: Colors.orange,
                ),
              ),
              new Positioned(
                top: 446.0,
                right: 26.0,
                child: Container(
                    height: 86.0,
                    width: 446.0,
                    padding: const EdgeInsets.fromLTRB(226.0, 0.0, 26.0, 0.0),
                    child: new Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3)),
              ),
              new Positioned(
                top: 574.0,
                left: 52.0,
                child: Container(
                  height: 82.0,
                  width: 144.0,
                  color: Colors.orange,
                ),
              ),
              new Positioned(
                top: 566.0,
                right: 26.0,
                child: Container(
                    height: 86.0,
                    width: 446.0,
                    padding: const EdgeInsets.fromLTRB(226.0, 0.0, 26.0, 0.0),
                    child: new Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3)),
              ),
            ]),
          ),
          Container(
            height: 88,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 22.0,
                left: 26.0,
                child: Container(
                  height: 44.0,
                  width: 152.0,
                  child: new Text(
                    '校友反馈',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: 1302,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 0.0,
                left: 0.0,
                child: Container(
                    height: 234.0,
                    width: 722.0,
                    margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                    child: Stack(
                      children: [
                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 234.0,
                            width: 182.0,
                            child: new Image.asset('image/LogoVIP.jpg',
                                fit: BoxFit.fill),
                          ),
                        ),
                        new Positioned(
                          top: 24.0,
                          left: 218.0,
                          child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.red[800],
                              height: 22.0,
                              width: 236.0,
                              child: new Text('Lu.labXX级功勋学员',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 218.0,
                          child: Container(
                            height: 32.0,
                            width: 56.0,
                            child: new Text('XX',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 308.0,
                          child: Container(
                            height: 22.0,
                            width: 100.0,
                            child: new Text('XXXXXX高管',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 106.0,
                          left: 218.0,
                          child: Container(
                            height: 100.0,
                            width: 772.0,
                            child: new Text(
                                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              new Positioned(
                top: 248.0,
                left: 0.0,
                child: Container(
                    height: 234.0,
                    width: 722.0,
                    margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                    child: Stack(
                      children: [
                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 234.0,
                            width: 182.0,
                            child: new Image.network(
                                'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                                fit: BoxFit.fill),
                          ),
                        ),
                        new Positioned(
                          top: 24.0,
                          left: 218.0,
                          child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.red[800],
                              height: 22.0,
                              width: 236.0,
                              child: new Text('Lu.labXX级功勋学员',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 218.0,
                          child: Container(
                            height: 32.0,
                            width: 56.0,
                            child: new Text('XX',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 308.0,
                          child: Container(
                            height: 22.0,
                            width: 100.0,
                            child: new Text('XXXXXX高管',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 106.0,
                          left: 206.0,
                          child: Container(
                            height: 100.0,
                            width: 482.0,
                            child: new Text(
                                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              new Positioned(
                top: 500.0,
                left: 0.0,
                child: Container(
                    height: 234.0,
                    width: 722.0,
                    margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                    child: Stack(
                      children: [
                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 234.0,
                            width: 182.0,
                            child: new Image.network(
                                'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                                fit: BoxFit.fill),
                          ),
                        ),
                        new Positioned(
                          top: 24.0,
                          left: 218.0,
                          child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.red[800],
                              height: 22.0,
                              width: 236.0,
                              child: new Text('Lu.labXX级功勋学员',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 218.0,
                          child: Container(
                            height: 32.0,
                            width: 56.0,
                            child: new Text('XX',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 308.0,
                          child: Container(
                            height: 22.0,
                            width: 100.0,
                            child: new Text('XXXXXX高管',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 106.0,
                          left: 206.0,
                          child: Container(
                            height: 100.0,
                            width: 482.0,
                            child: new Text(
                                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              new Positioned(
                top: 754.0,
                left: 0.0,
                child: Container(
                    height: 234.0,
                    width: 722.0,
                    margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                    child: Stack(
                      children: [
                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 234.0,
                            width: 182.0,
                            child: new Image.network(
                                'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                                fit: BoxFit.fill),
                          ),
                        ),
                        new Positioned(
                          top: 24.0,
                          left: 218.0,
                          child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.red[800],
                              height: 22.0,
                              width: 236.0,
                              child: new Text('Lu.labXX级功勋学员',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 218.0,
                          child: Container(
                            height: 32.0,
                            width: 56.0,
                            child: new Text('XX',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 308.0,
                          child: Container(
                            height: 22.0,
                            width: 100.0,
                            child: new Text('XXXXXX高管',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 106.0,
                          left: 206.0,
                          child: Container(
                            height: 100.0,
                            width: 482.0,
                            child: new Text(
                                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              new Positioned(
                top: 1002.0,
                left: 0.0,
                child: Container(
                    height: 234.0,
                    width: 722.0,
                    margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 66.0),
                    child: Stack(
                      children: [
                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 234.0,
                            width: 182.0,
                            child: new Image.network(
                                'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                                fit: BoxFit.fill),
                          ),
                        ),
                        new Positioned(
                          top: 24.0,
                          left: 218.0,
                          child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.red[800],
                              height: 22.0,
                              width: 236.0,
                              child: new Text('Lu.labXX级功勋学员',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 218.0,
                          child: Container(
                            height: 32.0,
                            width: 56.0,
                            child: new Text('XX',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 58.0,
                          left: 308.0,
                          child: Container(
                            height: 22.0,
                            width: 100.0,
                            child: new Text('XXXXXX高管',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        new Positioned(
                          top: 106.0,
                          left: 206.0,
                          child: Container(
                            height: 100.0,
                            width: 482.0,
                            child: new Text(
                                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            ]),
          ),
          Container(
            height: 88,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 22.0,
                left: 40.0,
                child: Container(
                  height: 44.0,
                  width: 152.0,
                  child: new Text(
                    '谁为你服务',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: 970,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 12.0,
                left: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 12.0,
                right: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 300.0,
                left: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 300.0,
                right: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 584.0,
                left: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 583.0,
                right: 40.0,
                child: Container(
                    height: 150.0,
                    width: 332.0,
                    child: new Image.network(
                        'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                        fit: BoxFit.fill)),
              ),
              new Positioned(
                top: 182.0,
                left: 60.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 182.0,
                left: 400.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 470.0,
                left: 60.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 470.0,
                left: 400.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 754.0,
                left: 60.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 754.0,
                left: 400.0,
                child: Container(
                  height: 36.0,
                  width: 96.0,
                  child: new Text(
                    '张晨',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 218.0,
                left: 60.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 218.0,
                left: 400.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 506.0,
                left: 60.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 506.0,
                left: 400.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 790.0,
                left: 60.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 790.0,
                left: 400.0,
                child: Container(
                  height: 28.0,
                  width: 186.0,
                  child: new Text(
                    'Lu.lab营销负责人',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: 88,
            width: 750,
            color: Colors.white,
            child: Stack(children: [
              new Positioned(
                top: 22.0,
                left: 26.0,
                child: Container(
                  height: 44.0,
                  width: 152.0,
                  child: new Text(
                    '常见问题',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
              height: 1424,
              width: 750,
              color: Colors.white,
              child: Stack(
                children: [
                  new Positioned(
                      top: 58.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 100.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ))),
                  new Positioned(
                      top: 272.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 314.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ))),
                  new Positioned(
                      top: 486.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 528.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ))),
                  new Positioned(
                      top: 700.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 742.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ))),
                  new Positioned(
                      top: 914.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 956.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ))),
                  new Positioned(
                      top: 1128.0,
                      left: 44.0,
                      child: Container(
                          height: 36,
                          width: 562,
                          child: Text(
                            '什么时间可以报名？学习多长时间',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  new Positioned(
                      top: 1170.0,
                      left: 44.0,
                      child: Container(
                          height: 172,
                          width: 562,
                          child: Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          )))
                ],
              )),
          Container(
            height: 84,
            width: 654,
            margin: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 0.0),
            color: Colors.orange,
            child: new Text(
              '添加招生顾问 咨询报名',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              height: 444,
              width: 750,
              child: Stack(children: [
                new Positioned(
                    top: 88,
                    left: 108,
                    child: Container(
                        height: 48,
                        width: 276,
                        color: Colors.grey,
                        child: new Text(
                          '毕业学生',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 160,
                    left: 108,
                    child: Container(
                        height: 74,
                        width: 276,
                        child: new Text(
                          'xxxx',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 88,
                    right: 74,
                    child: Container(
                        height: 48,
                        width: 276,
                        color: Colors.grey,
                        child: new Text(
                          '毕业学生',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 160,
                    right: 74,
                    child: Container(
                        height: 74,
                        width: 276,
                        child: new Text(
                          'xxxx',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 266,
                    left: 108,
                    child: Container(
                        height: 48,
                        width: 276,
                        color: Colors.grey,
                        child: new Text(
                          '毕业学生',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 338,
                    left: 108,
                    child: Container(
                        height: 74,
                        width: 276,
                        child: new Text(
                          'xxxx',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 266,
                    right: 74,
                    child: Container(
                        height: 48,
                        width: 276,
                        color: Colors.grey,
                        child: new Text(
                          '毕业学生',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                new Positioned(
                    top: 338,
                    right: 74,
                    child: Container(
                        height: 74,
                        width: 276,
                        child: new Text(
                          'xxxx',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              ])),

          Container(
              height: 110,
              width: 110,
              margin: const EdgeInsets.fromLTRB(326.0, 82.0, 326.0, 0.0),
              color: Colors.orange,
              child: new Image.network(
                  'data:image/jpeg;base64,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',
                  fit: BoxFit.fill)),
          Container(
              height: 46,
              width: 238,
              margin: const EdgeInsets.fromLTRB(256.0, 20.0, 256.0, 0.0),
              child: new Text(
                'Lu.lab训练营',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            height: 25,
            width: 68,
            margin: const EdgeInsets.fromLTRB(32.0, 44.0, 32.0, 20.0),
            color: Colors.orange,
            child: new Text(
              '戳此立即报名',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // child: Stack(
          //   children: [
          //     new Positioned(
          //         top: 88,
          //         left: 108,
          //         child: Stack(
          //           children: [
          //             new Positioned(
          //                 top: 0.0,
          //                 left: 0.0,
          //                 child: Container(
          //                     height: 178,
          //                     width: 276,
          //                     color: Colors.grey,
          //                     child: Text(
          //                       '毕业学生',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontSize: 13.0,
          //                       ),
          //                     ))),
          //             new Positioned(
          //                 top: 48,
          //                 left: 0,
          //                 child: Container(
          //                   height: 130,
          //                   width: 276,
          //                   child: Text(
          //                     'XXXX',
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                       fontSize: 32.0,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 )),
          //           ],
          //         )),
          //   ],
          // )),
          // Container(
          //   height: 1424,
          //   width: 750,
          //   color: Colors.white,
          //   child: Stack(children: [
          //     new Positioned(
          //         top: 58.0,
          //         left: 40.0,
          //         child: Stack(children: [
          //           new Positioned(
          //             top: 0.0,
          //             left: 4.0,
          //             child: Container(
          //               height: 36.0,
          //               width: 562.0,
          //               child: new Text(
          //                 '什么时间可以报名？学习多长时间？',
          //                 style: TextStyle(
          //                   fontSize: 16.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           new Positioned(
          //             top: 42.0,
          //             left: 28.0,
          //             child: Container(
          //               height: 214.0,
          //               width: 666.0,
          //               child: new Text(
          //                 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //                 textAlign: TextAlign.left,
          //                 maxLines: 5,
          //                 style: TextStyle(
          //                   fontSize: 13.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           )
          //         ])),
          //     // new Positioned(
          //     //     top: 272.0,
          //     //     left: 42.0,
          //     //     child: Stack(children: [
          //     //       new Positioned(
          //     //         top: 0.0,
          //     //         left: 4.0,
          //     //         child: Container(
          //     //           height: 36.0,
          //     //           width: 562.0,
          //     //           child: new Text(
          //     //             '什么时间可以报名？学习多长时间？',
          //     //             style: TextStyle(
          //     //               fontSize: 16.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //       new Positioned(
          //     //         top: 42.0,
          //     //         left: 28.0,
          //     //         child: Container(
          //     //           height: 214.0,
          //     //           width: 666.0,
          //     //           child: new Text(
          //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //     //             textAlign: TextAlign.left,
          //     //             maxLines: 5,
          //     //             style: TextStyle(
          //     //               fontSize: 13.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ])),
          //     // new Positioned(
          //     //     top: 486.0,
          //     //     left: 40.0,
          //     //     child: Stack(children: [
          //     //       new Positioned(
          //     //         top: 0.0,
          //     //         left: 4.0,
          //     //         child: Container(
          //     //           height: 36.0,
          //     //           width: 562.0,
          //     //           child: new Text(
          //     //             '什么时间可以报名？学习多长时间？',
          //     //             style: TextStyle(
          //     //               fontSize: 16.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //       new Positioned(
          //     //         top: 42.0,
          //     //         left: 28.0,
          //     //         child: Container(
          //     //           height: 214.0,
          //     //           width: 666.0,
          //     //           child: new Text(
          //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //     //             textAlign: TextAlign.left,
          //     //             maxLines: 5,
          //     //             style: TextStyle(
          //     //               fontSize: 13.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ])),
          //     // new Positioned(
          //     //     top: 700.0,
          //     //     left: 40.0,
          //     //     child: Stack(children: [
          //     //       new Positioned(
          //     //         top: 0.0,
          //     //         left: 4.0,
          //     //         child: Container(
          //     //           height: 36.0,
          //     //           width: 562.0,
          //     //           child: new Text(
          //     //             '什么时间可以报名？学习多长时间？',
          //     //             style: TextStyle(
          //     //               fontSize: 16.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //       new Positioned(
          //     //         top: 42.0,
          //     //         left: 28.0,
          //     //         child: Container(
          //     //           height: 214.0,
          //     //           width: 666.0,
          //     //           child: new Text(
          //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //     //             textAlign: TextAlign.left,
          //     //             maxLines: 5,
          //     //             style: TextStyle(
          //     //               fontSize: 13.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ])),
          //     // new Positioned(
          //     //     top: 914.0,
          //     //     left: 40.0,
          //     //     child: Stack(children: [
          //     //       new Positioned(
          //     //         top: 0.0,
          //     //         left: 4.0,
          //     //         child: Container(
          //     //           height: 36.0,
          //     //           width: 562.0,
          //     //           child: new Text(
          //     //             '什么时间可以报名？学习多长时间？',
          //     //             style: TextStyle(
          //     //               fontSize: 16.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //       new Positioned(
          //     //         top: 42.0,
          //     //         left: 28.0,
          //     //         child: Container(
          //     //           height: 214.0,
          //     //           width: 666.0,
          //     //           child: new Text(
          //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //     //             textAlign: TextAlign.left,
          //     //             maxLines: 5,
          //     //             style: TextStyle(
          //     //               fontSize: 13.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ])),
          //     // new Positioned(
          //     //     top: 1128.0,
          //     //     left: 40.0,
          //     //     child: Stack(children: [
          //     //       new Positioned(
          //     //         top: 0.0,
          //     //         left: 4.0,
          //     //         child: Container(
          //     //           height: 36.0,
          //     //           width: 562.0,
          //     //           child: new Text(
          //     //             '什么时间可以报名？学习多长时间？',
          //     //             style: TextStyle(
          //     //               fontSize: 16.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //       new Positioned(
          //     //         top: 42.0,
          //     //         left: 28.0,
          //     //         child: Container(
          //     //           height: 214.0,
          //     //           width: 666.0,
          //     //           child: new Text(
          //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          //     //             textAlign: TextAlign.left,
          //     //             maxLines: 5,
          //     //             style: TextStyle(
          //     //               fontSize: 13.0,
          //     //               fontWeight: FontWeight.bold,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ])),
          //   ]),
          // )
        ]),
      ),
    );
  }
}
