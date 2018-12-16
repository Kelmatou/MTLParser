# MTLParser

## Installation

 * Create a file named *Cartfile* at you project's root and write ```github "Kelmatou/MTLParser"``` in it.
 * Run command: ```carthage bootstrap --platform iOS``` in Terminal
 * Go to target General settings
 * Add iOSTools.framework in Embedded Binaries
 * If you cannot import MTLParser your project, go back to target settings ->
   Build Settings -> Framework Search Paths, then add the path to MTLParser.framework
 * Note: if you built simulator framework version, it will not be recognized
   unless you select simulator target. (same thing with device framework that
   must target iOS device or at least generic iOS device)

  MTLParser is now ready serve!
  
## Usage

MTLParser has only one method. Here is how to use it to parse your .mtl file:

```swift
guard let fileURL = Bundle.main.url(forResource: "test", withExtension: "mtl") else { return }
let mtlElements: [MTLElement] = MTLParser.parse(contentOf: fileURL)
    for mtlElement in mtlElements {
        print("MTLElement \(mtlElement.name)")
}
```

This parse function returns an array of Material elements with all informations you need (colors, texture files...)

## Supported fields

- Material name
- Ambiant color
- Diffuse color
- Specular color
- Emissive color
- Density (value between 0 and 1)
- Specular exponent (value between 0 and 100. Represent the weight of specular color)
- Transparency (value between 0 and 1, 1 means full opaque)
- Illumination (value between 0 and 10. Read more about illumination mode below)
- Ambiant texture file name
- Diffuse texture file name
- Specular texture file name

Theses are the most used but if you need some more listed in [MTL Specification](https://www.fileformat.info/format/material/index.htm), 
feel free to create an issue.

### Illumination mode

0 = Color on and Ambient off  
1 = Color on and Ambient on  
2 = Highlight on  
3 = Reflection on and Ray trace on  
4 = Transparency: Glass on, Reflection: Ray trace on  
5 = Reflection: Fresnel on and Ray trace on  
6 = Transparency: Refraction on, Reflection: Fresnel off and Ray trace on  
7 = Transparency: Refraction on, Reflection: Fresnel on and Ray trace on  
8 = Reflection on and Ray trace off  
9 = Transparency: Glass on, Reflection: Ray trace off  
10 = Casts shadows onto invisible surfaces  

[Source: Wikipedia](https://en.wikipedia.org/wiki/Wavefront_.obj_file#Material_template_library)

## Author

Antoine Clop ([Kelmatou](https://github.com/Kelmatou))  
