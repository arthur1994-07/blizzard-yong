package ran.ui.utils
{

    public class Util extends Object
    {
        public static const OBJ_TYPE_NULL:int = 0;
        public static const OBJ_TYPE_NUMBER:int = 1;
        public static const OBJ_TYPE_BOOL:int = 2;
        public static const OBJ_TYPE_STRING:int = 3;
        public static const OBJ_TYPE_INT:int = 4;
        public static const OBJ_TYPE_UINT:int = 5;

        public function Util()
        {
            return;
        }// end function

        public static function GetObjectType(param1:Object) : int
        {
            if (param1 is uint)
            {
                return OBJ_TYPE_UINT;
            }
            if (param1 is int)
            {
                return OBJ_TYPE_INT;
            }
            switch(typeof(param1))
            {
                case "number":
                {
                    return OBJ_TYPE_NUMBER;
                }
                case "boolean":
                {
                    return OBJ_TYPE_BOOL;
                }
                case "string":
                {
                    return OBJ_TYPE_STRING;
                }
                default:
                {
                    break;
                }
            }
            return OBJ_TYPE_NULL;
        }// end function

    }
}
