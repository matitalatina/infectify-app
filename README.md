![Infectify App](assets/icons/first-page-play-store-it.png)

# Infectify App

Data from Protezione Civile about Coronavirus in Italy.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## How to add secrets

### Android

If you want to add a secret in resources:

- Add it in `android/resource-secrets.xml`
- `cd android/secrets`
- `rm secrets.tar secrets.tar.enc`
- `tar cvf secrets.tar *`
- `travis encrypt-file secrets.tar`

If you want to check if it works locally:

- `cp android/secrets/resource-secrets.xml android/app/src/main/res/values/secrets.xml`
