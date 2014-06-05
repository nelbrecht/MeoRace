<?php

   class CommonPageFunction {
      
      public static function getLink( $module, $page, $id, $text, $parameter = null ) {
         $link = "<a href='index.php?module=$module&page=$page";
         if ( isset( $id ) ) {
            $link .= "&id=$id";
         }
         if ( isset( $parameter ) ) {
            $link .= "&$parameter";
         }
         $link .= "'>$text</a>";

         return $link;
      }

      public static function getLable( $key, $object, $text) {
         $result = "<tr><td>$text:</td><td>" . ( isset( $object ) ? $object->$key : " " ) ."</td></tr>";
         return $result;
      }

      public static function getInputField( $key, $object, $text) {
         $result = "<tr><td>$text:</td><td><input name='$key' value='" . ( isset( $object ) ? $object->$key : "" ) ."' /></td></tr>";
         return $result;
      }

      public static function getCheckbox( $key, $object, $text) {
         $result = "<tr><td>$text:</td><td><input type='checkbox' name='$key' value='1' " . ( ( isset( $object ) && $object->$key == 1) ? "checked" : "" ) . " /></td></tr>";
         return $result;
      }

      public static function getCombobox($key, $object, $text, $options, $optionKey = null ) {
         $result = "<tr><td>$text</td><td><select name='$key' size='1' >";
         foreach ( $options as $option ) {
            if ( isset( $optionKey ) ) {
               $value = $option->$optionKey;
               $name = $option->name;
            } else {
               $value = $option;
               $name = $option;
            }
            $result .= "<option value='" . $value . "' " . ( ( isset( $object ) && strcmp( $value, $object->$key)  == 0) ? "selected" : "" ). " >$name</option>";
         }
         $result .= "</select></td></tr>";
         return $result;
         
      }
   
   }

?>