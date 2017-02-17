import React, { Component } from 'react';

import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules
} from 'react-native';

class RNBatch extends Component {

  constructor(props) {
    super(props)

    const userId = "testuserid"
    const BatchManager = NativeModules.BatchManager

    // Init Batch and log the User in
    BatchManager.initReactApplication(() => {
      console.log('did finish intializing')
      BatchManager.logUser(userId, () => {
        console.log('did finish login')
      })
    })
  }

  render() {
    const trackEvent = () => {
      console.log('Tracking the event')
      const BatchManager = NativeModules.BatchManager

      BatchManager.buttonPushed(() => {
        console.log('BEWARE --- the button has been pushed')
      })
    }

    return (
      <View style={styles.container}>
        <Button
          title="Hit me"
          onPress={trackEvent}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
});

AppRegistry.registerComponent('RNBatch', () => RNBatch);

export default RNBatch;
