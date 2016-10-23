using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TB.Data
{
    public static class DbManager
    {
        public static SqlDatabase db;
        static DbManager()
        {
            db = new SqlDatabase("RetailMaster");
        }
        public static int Execute(string cmdText, QueryOption option)
        {
            if (option.ListParameters != null)
            {
                var clone = option.Clone() as QueryOption;
                clone.ListParameters = null;
                var count = 0;
                foreach (var p in option.ListParameters)
                {
                    clone.Parameters = p;
                    var c = DbManager.Execute(cmdText, clone);
                    if (c > 0)
                    {
                        count += c;
                    }
                }
                return count;
            }
            else
            {
                IList<string> output;
                var parameters = createListParameters(cmdText, option, db, out output);
                int rowCount = db.ExecuteNonQuery(cmdText, parameters);
                handleOutput(parameters, output, option.Parameters);
                return rowCount;
            }
        }

    }
}
