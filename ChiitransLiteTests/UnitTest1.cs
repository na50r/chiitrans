using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ChiitransLite.misc;

namespace ChiitransLiteTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestKataHira1()
        {
            string kata = "どー";
            string hira = TextUtils.katakanaToHiragana(kata);
            Assert.AreEqual("どう", hira);
        }
        [TestMethod]
        public void TestKataHira2()
        {
            string kata = "ドー";
            string hira = TextUtils.katakanaToHiragana(kata);
            Assert.AreEqual("どう", hira);
        }
    }
}
