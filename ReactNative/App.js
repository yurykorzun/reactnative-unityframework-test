import React, { Component } from 'react';
import {
  SafeAreaView,
  StyleSheet,
  View,
  Text,
  StatusBar,
  TouchableOpacity,
  NativeModules
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';

export default class App extends Component
{
  firstAction = () =>
  {
    NativeModules.LibraryTestRNModule.FirstAction();
  }

  secondAction = () =>
  {
    NativeModules.LibraryTestRNModule.SecondAction();
  }

  render() {
    return (
      <SafeAreaView style={{flex: 1}}>
          <View style={{flex: 1, justifyContent: 'center', alignContent: 'center'}}>
            <View style={{flexDirection:'row', justifyContent: 'center'}}>
              <Text style={{fontSize: 22}}>This is React Native</Text>
            </View>
            <View style={{marginTop: 20, flexDirection:'row', justifyContent: 'center'}}>
              <TouchableOpacity style={{flexDirection:'row', justifyContent: 'center', backgroundColor: "#000000", width: 220, paddingTop: 10, paddingBottom: 10}} onPress={this.firstAction}>
                <Text style={{fontSize: 18, color: "#ffffff"}}>First action</Text>
              </TouchableOpacity>
            </View>
            <View style={{marginTop: 20, flexDirection:'row', justifyContent: 'center'}}>
              <TouchableOpacity style={{flexDirection:'row', justifyContent: 'center',  backgroundColor: "#000000", width: 220, paddingTop: 10, paddingBottom: 10}} onPress={this.secondAction}>
                <Text style={{fontSize: 18, color: "#ffffff"}}>Second action</Text>
              </TouchableOpacity>
            </View>
          </View>
      </SafeAreaView>
    );
  }

};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});
