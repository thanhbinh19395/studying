﻿

namespace NPOI.Extension {
    using System;

    /// <summary>
    /// Represents a custom attribute to control excel filter behaviors.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
    public class FilterAttribute : Attribute {
        /// <summary>
        /// Initializes a new instance of the <see cref="FilterAttribute"/> class.
        /// </summary>
        public FilterAttribute() {
            LastRow = null;
        }

        /// <summary>
        /// Gets or sets the first row index.
        /// </summary>
        public int FirstRow { get; set; }

        /// <summary>
        /// Gets or sets  the last row index.
        /// </summary>
        /// <remarks>
        /// If the <see cref="LastRow"/> is null, the value is dynamic calculate by code.
        /// </remarks>
        public int? LastRow { get; set; }

        /// <summary>
        /// Gets or sets the first column index.
        /// </summary>
        public int FirstCol { get; set; }

        /// <summary>
        /// Gets or sets the last column index.
        /// </summary>
        public int LastCol { get; set; }
    }
}
