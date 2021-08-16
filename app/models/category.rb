class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食べ物・飲み物' },
    { id: 3, name: '電車・バス' },
    { id: 4, name: '学校で使う道具' },
    { id: 5, name: 'もらったお金' },
    { id: 6, name: 'その他' }
  ]
end
