

  List<String> getListFromString(String value) {

    if(value.isEmpty || value == "[]"){
      return [];
    }

    return value.substring(1, value.length-1).split(", ");
  }

