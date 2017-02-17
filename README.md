# RNBatch

This repository is an example of how you can integrate Batch (https://batch.com) with React Native.

All you have to do here is to add you API Key in the `ios > RNBatch > BatchManager.m` file.
Thus, change:

```objective-c
 [Batch startWithAPIKey:@"YOUR-KEY"];
```

with your key.

Be sure to complete the prerequisites before starting: https://batch.com/doc/ios/prerequisites.html

### BatchManager

In the `ios > RNBatch > BatchManager.m` file, you'll find three exported methods allowing you to:

- Initialize Batch with your API Key and ask the user to accept Push notifications.
- Log the user in Batch with its unique userId
- Log a custom event (custom data in Batch)
