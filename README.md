# reactx-types-react-patch
Patch of @types/react allowing sharing style sheets among React and ReactNative

## Installation

Instead of ```npm install --save-dev @types/react``` use:

```sh
npm install --save-dev "git+https://github.com/PavelPZ/reactx-types-react-patch.git"
```

#### 1. ```CSSProperties.fontWeight``` change
... to be compatible with ReactNative.TextStyle.fontWeight
```
fontWeight?: "normal" | "bold" | "100" | "200" | "300" | "400" | "500" | "600" | "700" | "800" | "900";
```

#### 2. ```CSSProperties``` is separated to two interfaces
```CSSPropertiesLow``` and ```CSSProperties```. CSSPropertiesLow does not contain followingthe  props: 
```
transform?: CSSWideKeyword | any;
[propertyName: string]: any;
```


--------------------------


These changes enable sharing of style sheets, e.g.

```
// type definition
type TakeFrom<T, K extends keyof T> = {[P in K]: T[P]}
type NativeCSS = RN.TextStyle | RN.ViewStyle | RN.ImageStyle
type CommonCSS<TNative extends NativeCSS> = TakeFrom<TNative, keyof TNative>

//stylesheet def
const style: CommonCSS<RN.TextStyle> = {
  fontWeight: '300',
  color: 'black'
}

//using in RN
const txt = <Text style={style}>Hallo world</Text>

//using in react
const span = <span style={style}>Hallo world</span>
```





