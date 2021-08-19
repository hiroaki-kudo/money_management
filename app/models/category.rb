class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '②:食べ物・飲み物' },
    { id: 3, name: '③:交通' },
    { id: 4, name: '④:学校で使う道具' },
    { id: 5, name: '⑤:もらったお金' },
    { id: 6, name: '⑥:その他' }
  ]
end
